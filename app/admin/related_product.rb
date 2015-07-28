ActiveAdmin.register RelatedProduct, as: 'Related Products' do 
  menu :parent => "Website"

  index do 
    column :product_sku
    column :related_product_sku
    actions
  end

  filter :product_sku

  form multipart: true do |f|
    product_sku = []
     Gemgento::Product.all.order(:sku).each do |p|
        if p.magento_type == "configurable"
          product_sku << p.sku
        elsif p.magento_type == "simple" && p.visibility != 1
          product_sku << p.sku
        end
      end

    f.inputs do
      f.input :product_sku, as: :select, collection: product_sku
      f.input :related_product_sku
      f.input :updated_at, as: :hidden, value: Time.now
    end
    f.actions
  end 
  
  controller do
    def permitted_params
      params.permit!
    end
  end

end