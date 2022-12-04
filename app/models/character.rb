class Character < ApplicationRecord
  belongs_to :element

  validates :name, :rarity, :constellation, :description, presence: true
end
