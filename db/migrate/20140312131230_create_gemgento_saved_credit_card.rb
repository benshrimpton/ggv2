class CreateGemgentoSavedCreditCard < ActiveRecord::Migration
  def change
    create_table :gemgento_saved_credit_cards, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :magento_id
      t.integer :user_id
      t.string :token
      t.string :cc_number
      t.integer :exp_month
      t.integer :exp_year
      t.string :cc_type
      t.timestamps
    end
  end
end
