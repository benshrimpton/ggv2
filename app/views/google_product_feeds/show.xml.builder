xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:g' => 'http://base.google.com/ns/1.0' do
  xml.channel do
    xml.title 'Jeffrey Rudes'
    xml.link root_url
    xml.description 'Jeffrey Rudes products feed.'

    @products.each do |product|
      next if (product.categories & @categories).empty?

      if product.magento_type == 'simple'
        xml.item do
          xml.title product.name
          xml.link gemgento.product_url(product)
          xml.description product.short_description
          xml.g :image_link, product_image(product)
          xml.g :condition, 'new'
          xml.g :id, product.sku
          xml.g :google_product_category, product.current_category.google_product_category
          xml.g :product_type, product.current_category.name

          # availability and pricing
          xml.g :availability, availability(product)
          xml.g :price, product.price

          # unique product identifiers
          xml.g :brand, 'Jeffrey Rudes'
          xml.g :gtin, product.sku

          # variant specifics
          xml.g :gender, 'male'
          xml.g :age_group, 'adult'
          xml.g :color, product.color
          xml.g :size, product.size
          xml.g :size_type, 'regular'
          xml.g :size_system, 'US'
        end

      else
        product.simple_products.each do |simple_product|
          xml.item do
            xml.title product.name
            xml.link gemgento.product_url(product)
            xml.description product.short_description
            xml.g :image_link, product_image(simple_product)
            xml.g :condition, 'new'
            xml.g :id, simple_product.sku
            xml.g :google_product_category, product.current_category.google_product_category
            xml.g :product_type, product.current_category.name

            # availability and pricing
            xml.g :availability, availability(simple_product)
            xml.g :price, simple_product.price

            # unique simple_product identifiers
            xml.g :brand, 'Jeffrey Rudes'
            xml.g :gtin, simple_product.sku
            xml.g :item_group_id, product.sku

            # variant specifics
            xml.g :gender, 'male'
            xml.g :age_group, 'adult'
            xml.g :color, simple_product.color
            xml.g :size, simple_product.size
            xml.g :size_type, 'regular'
            xml.g :size_system, 'US'
          end
        end
      end
    end
  end
end