module ApplicationHelper

  def logged_in?
    session[:traveler_id] == @traveler.id
  end
end
