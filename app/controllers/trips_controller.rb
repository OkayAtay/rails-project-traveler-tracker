require 'pry'
class TripsController < ApplicationController
  before_action :set_traveler, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
  end

  def create
      params["trip"]["attraction_ids"] = []
      params["trip"]["attraction_ids"] << params["trip"]["attraction_id"]
      @trip = Trip.new(trip_params)
      binding.pry
    if @trip.save
      redirect_to traveler_trips_path(@traveler)
    else
      render :new
    end
  end

  def index
    if params[:traveler_id].to_f == session[:traveler_id]
      @trips = Traveler.find_by_id(params[:traveler_id]).trips
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to traveler_trips_path(@traveler)
    else
      render :edit
    end
  end

  def attraction_attributes=(attraction_attributes)
    attraction_attributes.values.each do |attraction_attribute|
      attraction = Attraction.find_or_create_by(attraction_attribute)
      self.attractions << attraction
    end
  end

  def destroy
    @trip = Trip.find_by_id(params[:id])
    @trip.delete
    redirect_to traveler_path(@traveler)
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

  def set_traveler
    @traveler = Traveler.find_by_id(session[:traveler_id])
  end
end
