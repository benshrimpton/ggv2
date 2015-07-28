module ApplicationHelper

  def nav_categories
    @nav_categories ||= Gemgento::Category.top_level.navigation
  end

  def nav_categories_all
    @nav_categories_all ||= Gemgento::Category.all.navigation
  end

  # retina.js supprt
  def image_tag_with_retina(paperclip_object, style, options={})
    retina_style = (style.to_s + "_2x").to_sym
    image_tag(paperclip_object.url(style.to_sym), options.merge("data-at2x" => paperclip_object.url(retina_style)))
  end

  def product_image_tag(product, asset_type_code, style, options = {})
    asset = Gemgento::Asset.find_by_code(product, asset_type_code.to_s, current_store)
    if asset.nil? && product.magento_type == 'simple' && product.configurable_products.active.any? # check the configurable if the simple doesn't have images.
      asset = Gemgento::Asset.find_by_code(product.configurable_products.active.first, asset_type_code)
    end

    image_tag_with_retina(asset.image, style, { 'data-size' => asset.asset_file.file.image_size }.merge(options)) unless asset.nil?
  end

  def category_hierarchy(category)
    parents = []
    parent = category.parent

    while parent && !parent.parent_id.nil?
      parents << parent
      parent = parent.parent
    end

    return parents.reverse
  end

  def category_path(category, params = {})
    path = "/categories/#{category.url_key}"
    path += "?#{params.to_query}" if params.any?

    return path
  end


  # @param line_item [Gemgento::LineItem]
  def line_item_image_tag(line_item)
    src = ''

    if line_item.product.magento_type == 'simple'

      if line_item.product.configurable_products.any?
        src = line_item.product.configurable_products.first.assets.first.image.url(:thumb)
      else
        src = line_item.product.assets.first.image.url(:thumb)
      end

    elsif line_item.product.assets.any?
      src = line_item.product.assets.first.image.url(:thumb)
    end
    src
  end

  def linkable_product(product)
    if !product.is_catalog_visible? && product.configurable_products.any?
      return product.configurable_products.first

    else
      return product
    end
  end

  # @param category [Gemgento::Category]
  # @return [String]
  def side_nav_classes(category)
    classes = ''
    classes += ' has-children' if category.children.any?
    classes += ' open' if @current_category && category.children.include?(@current_category)

    return classes
  end

  #
  def pb_countries
    @pb_countries ||= begin
      iso2_codes = %w[
        AU AT BH BE BR BG CA CL CN CO CR HR CY CZ DK DO SV EE FI FR DE GR GT HN HK HU US ID IE IL IT JM JP KW LV LT MY
        MT MX NL NZ NO PA PH PL PT QA RO RU SA SG SK SI ZA KR ES SE CH TW TH TT TR UA AE GB
      ]
      Gemgento::Country.where(iso2_code: iso2_codes).order(:name)
    end
  end

  # Get product size by concatenating all possible size values.
  #
  # @return [String]
  def product_size(product)
    size_attributes = %w[size coats jacket denim knits leather overcoats ties t_shirts scarves shirts]
    size = ''

    size_attributes.each do |attr|
      size += product.attribute_value(attr).to_s
    end

    return size
  end

end
