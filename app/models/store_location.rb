class StoreLocation < ActiveRecord::Base

  has_attached_file :featured_image, :styles => { :large => "1200>", :thumb => "100x100>" }
  validates_attachment_content_type :featured_image, :content_type => /\Aimage\/.*\Z/

  def thumb_url
    self.attachment.url(:thumb)
  end

end
