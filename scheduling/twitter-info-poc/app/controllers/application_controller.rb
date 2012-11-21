class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "application"
  helper_method :logged_in?, :current_user

  protected
  
  def logged_in?
    !!current_user_id
  end

  def current_user
    @current_user ||= load_user(current_user_id)
  end

  def current_user=(user)
    session[:current_user_id] = user.try(:id)
  end

  def current_user_id
    session[:current_user_id]
  end

  def load_user(id)
    id ? User.find(id) : nil
  end

  def login_required
    unless logged_in?
      flash[:error] = "Login required"
    end
    redirect_to root_path
  end
end
