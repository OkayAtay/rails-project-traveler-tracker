class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    if @trip.save

  end


  private

  def trip_params
    params.require(:trip).permit(
      :name
      :start_date
      :end_date
    )

  end
end
