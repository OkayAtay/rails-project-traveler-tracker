module ApplicationHelper

  def logged_in?
    session[:traveler_id] == @traveler.id
  end

  def set_user
    @traveler = Traveler.find(params[:id])
  end

end
