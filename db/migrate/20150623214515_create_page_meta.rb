class CreatePageMeta < ActiveRecord::Migration
  def change
    create_table :page_meta do |t|
      t.string :request_path
      t.string :title
      t.string :keywords

      t.timestamps
    end
  end
end
