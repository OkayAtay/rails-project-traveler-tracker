require 'pry'

class Trip < ApplicationRecord
  belongs_to :traveler
  belongs_to :attraction

  def self.trips?
    if self.all == []
      false
    end
  end

  def self.upcoming_trips
    @upcoming_trips = Trip.find(:start_date < 90.days.from_now)
  end

end
