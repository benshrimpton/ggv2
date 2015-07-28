class AddUrlKeyFieldToPages < ActiveRecord::Migration
  def change
    add_column :pages, :url_key, :string
  end
end
