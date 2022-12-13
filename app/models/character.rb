class Character < ApplicationRecord
  belongs_to :element

  validates :name, :rarity, :constellation, :description, presence: true

  paginates_per 10

  has_one_attached :image

  after_create do
    character = Stripe::Product.create(name:name)
    price = Stripe::Price.create(product: character, unit_amount: self.price, currency: "cad")
    update(stripe_product_id: character.id)
  end
end
