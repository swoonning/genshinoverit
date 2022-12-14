class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :stripe_customer_address, :string
  end
end
