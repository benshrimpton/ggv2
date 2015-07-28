class ChangeTextFieldsInCollections < ActiveRecord::Migration
  def change
    change_column :lookbook_images, :text_field_1, :text
    change_column :lookbook_images, :text_field_2, :text
    remove_column :lookbook_images, :text_field_3
  end
end
