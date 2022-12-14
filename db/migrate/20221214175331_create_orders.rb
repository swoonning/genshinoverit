class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
        t.references :customer_id
        t.string :stripe_order_id
        t.date :order_date
      t.timestamps
    end
  end
end
