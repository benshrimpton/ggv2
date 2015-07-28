class AddTitleFieldForLookBookImage < ActiveRecord::Migration
  def change
    add_column :lookbook_images, :title, :string
  end
end
