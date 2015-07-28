class Page < ActiveRecord::Base
  validates :page_title, :page_content, :url_key, presence: true
  validates :url_key, uniqueness: true

  default_scope -> { order :order }
end
