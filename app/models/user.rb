class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def to_s
    email
    address
  end

  after_create do
    customer = Stripe::Customer.create(email: email, address: {line1: address})
    update(stripe_customer_id: customer.id)
    update(stripe_customer_address: customer.address.line1)
  end
end
