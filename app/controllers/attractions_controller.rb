require 'pry'
class AttractionsController < ApplicationController
before_action :set_traveler

  def new
    @attraction = Attraction.new
    render :layout => false
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      render json: @attraction, status: 201
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @attraction}
    end
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

  def destroy 
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.delete
    redirect_to attractions_path
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
