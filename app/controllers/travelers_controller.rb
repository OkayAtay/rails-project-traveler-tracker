class TravelersController < ApplicationController
  before_action :set_user, only: [:show]

  def show

  end

  def index

  end

  def trips_index
    @traveler = Traveler.find(params[:id])
    @trips = @traveler.trips
    render template: 'trips/index'
  end

  def trip
    @traveler = Traveler.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    render template: 'trips/show'
  end

  def new
    @traveler = Traveler.new
  end

  def create
    @traveler = Traveler.new(traveler_params)
    if @traveler.save
      session[:traveler_id] = @traveler.id
      redirect_to @traveler
    else
      render :new
    end
  end

  private

  def traveler_params
    params.require(:traveler).permit(
      :name,
      :email,
      :budget,
      :password,
      :nationality,
      :interests
    )
  end
end
