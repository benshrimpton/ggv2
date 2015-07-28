class AddTextFieldToPages < ActiveRecord::Migration
  def change
     add_column :pages, :page_content, :text
  end
end
