class Journalimage < ActiveRecord::Base
  belongs_to :post
  has_attached_file :journal_image, :styles => {:large => "1200>", :thumb => "200x200>"}
  validates_attachment_content_type :journal_image, :content_type => /\Aimage\/.*\Z/
end
