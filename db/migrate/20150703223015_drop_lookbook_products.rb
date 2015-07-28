class DropLookbookProducts < ActiveRecord::Migration
  def change
    drop_table :lookbook_products
  end
end
