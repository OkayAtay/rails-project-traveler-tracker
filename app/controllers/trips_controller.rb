require 'pry'
class TripsController < ApplicationController
  before_action :set_user, only: [:create, :show, :index]

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
    3.times {@trip.attractions.build}
  end

  def create
        trip = Trip.create(trip_params)
    if trip.save
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

  def attraction_attributes=(attraction_attributes)
    attraction_attributes.values.each do |attraction_attribute|
      attraction = Attraction.find_or_create_by(attraction_attribute)
      self.attractions << attraction
    end
  end


  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :traveler_id,
      attraction_ids:[],
      attraction_attributes: [:name,:location,:hours,:price]
    )
  end

end
