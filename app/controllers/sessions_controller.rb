require 'pry'

class SessionsController < ApplicationController

  def new
    @traveler = Traveler.new
  end

  def create
    if auth_hash =  request.env['omniauth.auth']
      @traveler = Traveler.find_or_create_by(:id => auth_hash['uid']) do |t|
        binding.pry
        t.name = auth_hash["info"]["nickname"],
        t.email = auth_hash["info"]["email"],
        t.password = SecureRandom.hex
      end
        session[:traveler_id] = @traveler.id
        redirect_to traveler_path(@traveler)
    else
      @traveler = Traveler.find_by(name: params[:traveler][:name])
      if @traveler && @traveler.authenticate(params[:traveler][:password])
        session[:traveler_id] = @traveler.id
        redirect_to traveler_path(@traveler)
      else
        render :new
      end
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
