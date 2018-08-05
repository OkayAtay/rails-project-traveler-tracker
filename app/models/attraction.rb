class Attraction < ApplicationRecord
  has_and_belongs_to_many :trips
  has_many :travelers, through: :trips

  validates :name, :location, :hours, presence: true
  validates :name, uniqueness: true
end
