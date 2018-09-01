require 'pry'
class TripsController < ApplicationController
  before_action :set_traveler, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  def new
    @trip = Trip.new(traveler_id: params[:traveler_id])
  end

  def create
    binding.pry
      @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to traveler_trips_path(@traveler)
    else
      render :new
    end
  end

  def index
    if params[:traveler_id].to_f == session[:traveler_id]
      @trips = Traveler.find_by_id(params[:traveler_id]).trips
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @trips.to_json}
      end
    else
      render :new
    end
  end

  # // DELETE /travelers/:traveler_id/trips/:id(.:format)
  def destroy
    @traveler = Traveler.find(params[:traveler_id])
    @trip = @traveler.trips.find(params[:id])
    @trip.destroy
    redirect_to traveler_path(@traveler)
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
