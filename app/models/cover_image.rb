class CoverImage < ActiveRecord::Base
  has_attached_file :image_desktop, :styles => { :large => "2560>", :desktop => "1100x", :thumb => "100x100>" }
  has_attached_file :image_mobile, :styles => { :large => "960>", :thumb => "100x100>" }
  validates_attachment_content_type :image_desktop, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image_mobile, :content_type => /\Aimage\/.*\Z/
end
