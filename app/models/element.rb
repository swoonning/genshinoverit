class Element < ApplicationRecord
  has_many :characters

  validates :element, presence: true
end
