class AddAddressableToGemgentoAddresses < ActiveRecord::Migration
  def change
    add_reference :gemgento_addresses, :addressable, polymorphic: true, index: true, after: :id
  end
end
