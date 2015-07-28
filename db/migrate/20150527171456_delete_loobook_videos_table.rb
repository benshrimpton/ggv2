class DeleteLoobookVideosTable < ActiveRecord::Migration
  def change
    drop_table :lookbook_videos
  end
end
