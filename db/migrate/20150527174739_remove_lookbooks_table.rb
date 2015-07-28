class RemoveLookbooksTable < ActiveRecord::Migration
  def change
    drop_table :lookbooks
  end
end
