class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def login_required
    if !session[:user_id]
      respond_to do |format|
        format.html  {
          redirect_to '/auth/tripolis'
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end

  def current_user
    return nil unless session[:user_id]
    #@current_user ||= User.find_by_uid(session[:user_id])      #['uid']
    @current_user ||= User.find(session[:user_id])
  end

end
