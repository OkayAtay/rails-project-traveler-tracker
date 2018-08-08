require 'pry'

class Trip < ApplicationRecord
  belongs_to :traveler
  has_and_belongs_to_many :attractions
  accepts_nested_attributes_for :attractions

  validates :name, :traveler_id, presence: true

  def self.trips?
    if self.all == []
      false
    end
  end

  def self.upcoming_trips
    binding.pry
    @upcoming_trips = Trip.where(:start_date < 90.days.from_now)
  end

end

#belongs_to traveler
#attraction has_many trips
#trip has_many attractions
#trip_attractions
