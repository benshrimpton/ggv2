class AddFieldsForLookBookImages < ActiveRecord::Migration
  def change
    add_column :lookbook_images, :text_field_1, :string
    add_column :lookbook_images, :text_field_2, :string
    add_column :lookbook_images, :text_field_3, :string
  end
end
