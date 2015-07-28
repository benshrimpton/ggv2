class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sub_title, :string
  end
end
