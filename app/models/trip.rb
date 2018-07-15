class Trip < ApplicationRecord
  belongs_to :traveler
  belongs_to :attraction

  def self.upcoming_trips
    @upcoming_trips = Trip.where(:start_date < 90.days.from_now)
  end
end
