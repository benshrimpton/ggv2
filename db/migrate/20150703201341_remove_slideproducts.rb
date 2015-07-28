class RemoveSlideproducts < ActiveRecord::Migration
  def change
    drop_table :slideproducts
  end
end
