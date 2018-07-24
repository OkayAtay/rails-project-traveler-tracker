require 'pry'
class TripsController < ApplicationController
  before_action :set_user, only: [:show, :index]

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
  end

  def create
        trip = Trip.create(trip_params)
    if trip.save?
      redirect_to traveler_trips_path(@traveler)
    else
      render :new
    end
  end

  def index
    if params[:traveler_id]
      @trips = Traveler.find(params[:traveler_id]).trips
    else
      @trips = Trip.all
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end


  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :traveler_id,
      attraction_ids:[]
    )
  end

end
