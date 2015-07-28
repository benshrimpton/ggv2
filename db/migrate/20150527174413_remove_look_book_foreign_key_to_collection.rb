class RemoveLookBookForeignKeyToCollection < ActiveRecord::Migration
  def change
     remove_column :collections, :collection_id
  end
end
