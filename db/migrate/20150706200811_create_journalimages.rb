class CreateJournalimages < ActiveRecord::Migration
  def change
    create_table :journalimages do |t|

      t.timestamps
    end
  end
end
