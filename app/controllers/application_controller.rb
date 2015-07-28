include Gemgento::ApplicationHelper

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_action :detect_device_format
  before_filter :get_page_meta

  # def after_sign_in_path_for(resource)
  #   redirect_to "/user/addresses"
  # end

  def get_page_meta
    @page_meta = PageMeta.find_by(request_path: request.path)
  end

  private

    def detect_device_format
      case request.user_agent
      when /iPad/i
        request.variant = :tablet
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Android/i
        request.variant = :tablet
      when /Windows Phone/i
        request.variant = :phone
      end
    end

    def product_image_tag(product, asset_type_code, style, options = {})
      asset = Gemgento::Asset.find_by_code(product, asset_type_code.to_s, current_store)

      if asset.nil? && product.magento_type == 'simple' && product.configurable_products.active.any? # check the configurable if the simple doesn't have images.
        asset = Gemgento::Asset.find_by_code(product.configurable_products.active.first, asset_type_code)
      end

      image_tag_with_retina(asset.image, style, { 'data-size' => asset.asset_file.file.image_size }.merge(options)) unless asset.nil?
    end

end