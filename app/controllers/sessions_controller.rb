require 'pry'

class SessionsController < ApplicationController

  def new
    @traveler = Traveler.new
    @travelers = Traveler.all
  end

  def create
    @traveler = Traveler.find_by(name: params[:traveler][:name])
    if @traveler && @traveler.authenticate(params[:traveler][:password])
      session[:traveler_id] = @traveler.id
      redirect_to @traveler
    else
      render :new
    end
  end

end
