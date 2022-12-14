class AddAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string, null: false, default: ""
  end
end
