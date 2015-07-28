class AddAttachmentsToJournalimage < ActiveRecord::Migration
  def change
     add_attachment :journalimages, :journal_image
  end
end
