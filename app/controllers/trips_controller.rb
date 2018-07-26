require 'pry'
class TripsController < ApplicationController
  before_action :set_traveler, only: [:new, :create, :show, :index]

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
  end

  def create
      trip = Trip.new(
        name: params[:trip][:name],
        start_date: params[:trip][:start_date],
        traveler_id: params[:trip][:traveler_id],
      ) #list out parameters 1x1, then iterate through the Ids and build them into the attractions array
    if trip.valid?
      binding.pry
      @attractions = params[:trips][:attraction_ids]
      @attractions.each do |a|
        if a != ""
          trip.attractions << a
        end
      end
      @attraction = trip.build_attraction (
        # name: params[:trip][:attraction][:name],
        # location: params[:trip][:attraction][:location],
        # hours: params[:trip][:attraction][:hours],
        # price: params[:trip][:attraction][:price]
      )
      trip.save
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

  def set_traveler
    @traveler = Traveler.find(params[:traveler_id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to traveler_trips_path(@traveler)
  end

  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :traveler_id,
      attraction_ids:[],
      attraction: [:name,:location,:hours,:price]
    )
  end

end
