class Teamwork::Customers

  def self.search(query, fields = %w[primaryEmail])
    Teamwork.call('customers/search', query: query, fields: fields)
  end

end