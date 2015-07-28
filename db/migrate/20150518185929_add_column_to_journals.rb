class AddColumnToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :title, :string
    add_column :journals, :body, :text
  end
end
