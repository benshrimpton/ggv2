lock '3.3.3'

set :application, 'jeffreyrudes'
set :repo_url, 'git@github.com:mauinewyork/jeffreyrudes'


set :linked_dirs, fetch(:linked_dirs, []).push(
                    'bin', 'log', 'solr', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
                    'vendor/bundle', 'public/system'
                )

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end

after 'deploy:updated', 'newrelic:notice_deployment'
after 'deploy:publishing', 'deploy:restart'
after "deploy:finishing", "deploy:sitemap:refresh"

namespace :solr do
  %w[start stop].each do |command|
    desc "#{command} solr"
    task command do
      on roles(:app) do
        within current_path do
          with rails_env: fetch(:rails_env, 'production') do
            solr_pid = "#{shared_path}/solr/pids/#{fetch(:rails_env, 'production')}/sunspot-solr-#{fetch(:rails_env, 'production')}.pid"
            if command == 'start' || (test("[ -f #{solr_pid} ]") && test("kill -0 $( cat #{solr_pid} )"))
              execute :bundle, 'exec', :rake, "sunspot:solr:#{command}"
            end
          end
        end
      end
    end
  end

  desc "restart solr"
  task :restart do
    invoke 'solr:stop'
    invoke 'solr:start'
  end

  after 'deploy:finished', 'solr:restart'

  desc "reindex the whole solr database"
  task :reindex do
    invoke 'solr:stop'
    on roles(:app) do
      execute :rm, "-rf #{shared_path}/solr/data"
    end
    invoke 'solr:start'
    on roles(:app) do
      within current_path do
        with rails_env: fetch(:rails_env, 'production') do
          info "Reindexing Solr database"
          execute :bundle, 'exec', :rake, 'sunspot:solr:reindex[,,true]'
        end
      end
    end
  end

  #after 'deploy:finished', 'solr:reindex'
end
