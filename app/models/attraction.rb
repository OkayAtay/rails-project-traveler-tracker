class Attraction < ApplicationRecord
  has_many :trips
  has_many :travelers, through: :trips

  validates :name, :location, :hours, presence: true
end
