class AddAboutPage < ActiveRecord::Migration
  def change
    create_table :about do |t|
      t.text :about_text
    end
  end
end
