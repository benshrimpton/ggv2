class CreateCoverImages < ActiveRecord::Migration
  def change
    create_table :cover_images do |t|
      t.attachment :image_desktop
      t.text :image_desktop_meta
      t.attachment :image_mobile
      t.text :image_mobile_meta
      t.timestamps
    end
  end
end
