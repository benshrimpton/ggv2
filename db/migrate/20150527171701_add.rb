class Add < ActiveRecord::Migration
  def change
    add_column :lookbooks, :video_id, :string
  end
end
