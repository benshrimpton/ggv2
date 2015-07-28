class Collection < ActiveRecord::Base
  has_many :lookbook_images
  accepts_nested_attributes_for :lookbook_images, allow_destroy: true
  before_save :set_url_key

  private
    def set_url_key
      self.url_key = self.name.parameterize
    end
end
