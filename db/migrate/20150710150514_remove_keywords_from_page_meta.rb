class RemoveKeywordsFromPageMeta < ActiveRecord::Migration
  def change
    remove_column :page_meta, :keywords
  end
end
