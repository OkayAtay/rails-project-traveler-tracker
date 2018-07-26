class AttractionsController < ApplicationController
before_action :set_traveler, only: [:new, :create, :show, :index]

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
    @attraction = Attraction.find_by(params[:id])
  end

  def index
    @attractions = Attraction.all
  end

  def set_traveler
    @traveler = Traveler.find(session[:traveler_id])
  end

  def edit

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
end
