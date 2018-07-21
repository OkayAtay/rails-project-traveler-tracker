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
    @trav
  end

  def new
    @traveler = Traveler.new
  end

  def create
    if @traveler.save
      session[:traveler_id] = @traveler.id
      redirect_to @traveler
    else
      render :new
    end
  end

  private

  def set_user
    @traveler = Traveler.find(params[:id])
  end

  def traveler_params
    params.require(:traveler).permit(
      :name,
      :email,
      :budget,
      :nationality,
      :interests
    )
  end
end
