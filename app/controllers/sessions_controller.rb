require 'pry'

class SessionsController < ApplicationController

  def new
    @traveler = Traveler.new
    @travelers = Traveler.all
  end

  def create
    if auth_has = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["email"]
      if @traveler = Traveler.find_by(email: oauth_email)
        session[:traveler_id] = @traveler.id
        redirect_to @traveler
      else
        @traveler = Traveler.create(email: oauth_email)
        redirect_to @traveler
      end
    else
      @traveler = Traveler.find_by(name: params[:traveler][:name])
      if @traveler && @traveler.authenticate(params[:traveler][:password])
        session[:traveler_id] = @traveler.id
        redirect_to @traveler
      else
        render :new
      end
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end

end
