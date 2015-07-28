class AddVideoIdToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :video_id, :integer
  end
end
