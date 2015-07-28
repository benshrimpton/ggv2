class AddDescriptionToPageMeta < ActiveRecord::Migration
  def change
    add_column :page_meta, :description, :text
  end
end
