class CreateLookbookProducts < ActiveRecord::Migration
  def change
    create_table :lookbook_products do |t|

      t.timestamps
    end
  end
end
