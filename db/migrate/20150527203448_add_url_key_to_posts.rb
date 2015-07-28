class AddUrlKeyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :url_key, :string
  end
end
