server 'jr.mny.mx', user: 'sdeploy', roles: %w{app web db}
set :deploy_to, '/var/www/production.jeffreyrudes'
set :rails_env, :production