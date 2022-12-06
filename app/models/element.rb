class Element < ApplicationRecord
  has_many :characters

  validates :element, presence: true

  def display_name
    element
  end
end
