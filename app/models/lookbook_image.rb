class LookbookImage < ActiveRecord::Base
  
  belongs_to :collection
  validates :lookbook_image, :presence => true
  validates :lookbook_image_1, :presence => true

  has_attached_file :lookbook_image, :styles => {
  :large => "1200>", :thumb => "200x200>"}
  has_attached_file :lookbook_image_1, :styles => {
  :large => "1200>", :thumb => "200x200>"}

  validates_attachment_content_type :lookbook_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :lookbook_image_1, :content_type => /\Aimage\/.*\Z/

  before_validation :convert_to_gemgento_ids
  serialize :gemgento_product_id, Array
  serialize :gemgento_product_id_1, Array

private

  def convert_to_gemgento_ids
    if self.product_id
      magento_ids = self.product_id.split(",")
      gemgento_ids = []
      magento_ids.each do |sku_num|
        if Gemgento::Product.find_by(sku: sku_num.strip) != nil
          gemgento_ids << Gemgento::Product.find_by(sku: sku_num.strip).id
        end
      end
      self.gemgento_product_id = gemgento_ids
    end

    if self.product_id_1
      magento_ids = self.product_id_1.split(",")
      gemgento_ids = []
      magento_ids.each do |sku_num|
        if Gemgento::Product.find_by(sku: sku_num.strip) != nil
          gemgento_ids << Gemgento::Product.find_by(sku: sku_num.strip).id
        end
      end
      self.gemgento_product_id_1 = gemgento_ids
    end
  end
end
