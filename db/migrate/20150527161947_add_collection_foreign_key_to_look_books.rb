class AddCollectionForeignKeyToLookBooks < ActiveRecord::Migration
  def change
    add_column :lookbooks, :collection_id, :integer 
  end
end
