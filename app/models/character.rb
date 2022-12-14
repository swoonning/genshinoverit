class Character < ApplicationRecord
  belongs_to :element

  validates :name, :rarity, :constellation, :description, presence: true

  paginates_per 10

  has_one_attached :image

  def to_builder
    Jbuilder.new do |character|
      character.quantity 1
      character.price stripe_price_id

    end
  end

  after_create do
    character = Stripe::Product.create(name:name)
    price = Stripe::Price.create(product: character, unit_amount: self.price, currency: "cad", tax_behavior: 'exclusive')
    update(stripe_product_id: character.id, stripe_price_id: price.id)
  end
end
