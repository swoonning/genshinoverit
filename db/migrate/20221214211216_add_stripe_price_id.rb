class AddStripePriceId < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :stripe_price_id, :string
  end
end
