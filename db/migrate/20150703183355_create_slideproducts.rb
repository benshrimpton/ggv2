class CreateSlideproducts < ActiveRecord::Migration
  def change
    create_table :slideproducts do |t|

      t.timestamps
    end
  end
end
