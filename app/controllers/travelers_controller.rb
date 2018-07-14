class TravelersController < ApplicationController

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
