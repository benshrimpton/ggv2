class RelatedProduct < ActiveRecord::Base
  belongs_to :gemgento_product

  validates :product_id, presence: true

  before_validation :save_product_id

  private

  def save_product_id 
    if self.product_sku
      product_id = Gemgento::Product.find_by(sku: self.product_sku).id
      self.product_id = product_id
    end
  end

end