class AddOrderToPages < ActiveRecord::Migration
  def change
    add_column :pages, :order, :integer, null: false, default: 0
  end
end
