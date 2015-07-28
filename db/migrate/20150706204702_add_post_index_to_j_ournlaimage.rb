class AddPostIndexToJOurnlaimage < ActiveRecord::Migration
  def change
    add_reference :journalimages, :post, index: true
  end
end
