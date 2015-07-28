class CreateLookbookImages < ActiveRecord::Migration
  def change
    create_table :lookbook_images do |t|
      t.integer :lookbook_id
      t.string :position
      t.string :integer

      t.timestamps
    end
  end
end
