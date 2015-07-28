class ChangeVideoIdToVarchar < ActiveRecord::Migration
  def change
    change_column :collections, :video_id, :string
  end
end
