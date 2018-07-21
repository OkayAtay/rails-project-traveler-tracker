class TripsController < ApplicationController

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
  end

  def create
    if @trip.save
    end
  end

  def index
    @trips = Trip.all
  end

  def show

  end


  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :traveler_id
      attraction_ids:[]
    )
  end

end
