class RemovePermalinkFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :permalink
  end
end
