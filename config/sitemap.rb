# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.jeffreyrudes.com"
SitemapGenerator::Sitemap.create do

  add '/about', changefreq: 'montly'
  add '/customer-service', changefreq: 'monthly'
  add '/shipping-returns', changefreq: 'monthly'
  add '/look/stream', changefreq: 'monthly'
  add '/terms-of-use', changefreq: 'monthly'
  Gemgento::Category.top_level.each do |c|
    add '/categories/'+c.url_key, changefreq: 'daily'
  end
   Gemgento::Product.active.catalog_visible.each do |p|
    add '/products/'+(p.url_key.present? ? p.url_key : p.id.to_s), changefreq: 'daily'
  end 
end
