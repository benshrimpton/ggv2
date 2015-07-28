class RenameJournalTopPost < ActiveRecord::Migration
  def change
    rename_table :journals, :posts
  end
end
