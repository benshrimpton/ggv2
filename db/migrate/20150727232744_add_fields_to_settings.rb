class AddFieldsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :facebook_url, :string
    add_column :settings, :instagram_url, :string
    add_column :settings, :twitter_url, :string
    add_column :settings, :pinterest_url, :string
    add_column :settings, :ga, :string
  end
end
