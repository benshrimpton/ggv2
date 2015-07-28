class AddZipCodeToSubscribers < ActiveRecord::Migration
  def change
    add_column :gemgento_subscribers, :zip_code, :string
  end
end
