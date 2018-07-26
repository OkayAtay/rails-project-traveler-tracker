require 'pry'
class TripsController < ApplicationController
  before_action :set_traveler, only: [:new, :create, :show, :index]

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
  end

  def create
      trip = Trip.new(trip_params
      ) #list out parameters 1x1, then iterate through the Ids and build them into the attractions array
    if trip.valid?
      binding.pry
      @attractions = params[:trip][:attraction_ids]
      @attractions.reject! {|a| a.empty?}
      @attractions.each do |a|
          trip.attractions << Attraction.find_by_id(a.to_i)
      end
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

  def delete
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
    )
  end

end
