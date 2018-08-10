require 'pry'

class StaticPagesController < ApplicationController

  def index
    if session[:traveler_id]
      @traveler = Traveler.find_by_id(session[:traveler_id])
      if @traveler
        redirect_to traveler_path(@traveler)
      else
        :index
      end
    end
  end

end
