class RefactorHomepageImages < ActiveRecord::Migration
  def change
    drop_table :homepage_images
    create_table :homepage_images do |t|      
      t.string :menu_name
      t.text :image_desktop_meta
      t.text :image_mobile_meta
      t.timestamps
    end
    add_attachment :homepage_images, :image_desktop
    add_attachment :homepage_images, :image_mobile
  end
end
