require 'pry'
class AttractionsController < ApplicationController
before_action :set_traveler

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    render json: @attraction
  end

  def index
    @attractions = Attraction.all
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :location,
      :hours,
      :price,
    )
  end

  def set_traveler
    @traveler = Traveler.find_by_id(session[:traveler_id])
  end
end
