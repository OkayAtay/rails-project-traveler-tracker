require 'pry'
class TravelersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_traveler, only: [:show, :index]


  def show
    render :show
  end

  def index
    @travelers = Traveler.all
    render :index
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

  def require_login
    return head(:forbidden) unless session.include? :traveler_id
  end

  def set_traveler
        @traveler = Traveler.find_by_id(session[:traveler_id])
  end

end
