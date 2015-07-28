class AddLinkTextToPages < ActiveRecord::Migration
  def change
    add_column :pages, :link_text, :string, index: true
  end
end
