class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :logged_in?, :current_user

  protected

  def logged_in?
    !!current_user
  end

  def current_user
     session[:current_user]
  end

  def current_user=(user)
    session[:current_user] = user
  end

  def current_user_id
    session[:current_user]
  end

  def login_required
    unless logged_in?
      flash[:error] = "Login required"
      redirect_to root_path
    end
  end
end
