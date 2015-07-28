class Post < ActiveRecord::Base
  
  has_many :journalimages
  accepts_nested_attributes_for :journalimages, allow_destroy: true
  
  has_attached_file :featured_image, :styles => { :large => "1200x1200>", :thumb => "150x150>" }
  has_attached_file :featured_image_vert, :styles => { :large => "450x600#", :thumb => "150x150>" }

  validates_attachment_content_type :featured_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :featured_image_vert, :content_type => /\Aimage\/.*\Z/
  
  private
    before_save :set_url_key
    
    def set_url_key
      self.url_key = self.title.parameterize
    end

end
