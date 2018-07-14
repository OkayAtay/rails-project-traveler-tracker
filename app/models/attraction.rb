class Attraction < ApplicationRecord
  scope :budget_traveller, -> {where(price: <20)}

  has_many :trips
  has_many :travelers, through: :trips

  validates :name, :location, :hours, presence: true
end
