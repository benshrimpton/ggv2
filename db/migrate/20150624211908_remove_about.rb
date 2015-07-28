class RemoveAbout < ActiveRecord::Migration
  def change
    drop_table :about
  end
end
