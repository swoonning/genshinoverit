class AddPrice < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :price, :integer
  end
end
