class Search < ActiveRecord::Base
  validates :keywords, uniqueness: true

  searchable do
    text :keywords, as: :keywords_textp
  end

  # Perform a search.
  #
  # @param query [String]
  # @return [Sunspot::Search::StandardSearch]
  def self.perform(query)
    if query && query.length >= 3
      search = Product.solr_search do
        fulltext query
      end

      record(query) if search.results.any?
    else
      search = nil
    end

    return search
  end

  # Record a searches query parameter.  Increment the weight of the keywords evey time they are recorded.
  #
  # @param keywords [String]
  # @return [Void]
  def self.record(keywords)
    search = Search.find_or_initialize_by(keywords: keywords)
    search.weight += 1
    search.save
  end
end
