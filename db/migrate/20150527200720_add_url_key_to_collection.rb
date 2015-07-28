class AddUrlKeyToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :url_key, :string
  end
end
