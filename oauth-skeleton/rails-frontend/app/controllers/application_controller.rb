class ApplicationController < ActionController::Base
  protect_from_forgery
  #around_filter :set_token

  protected
  def app_config
    SimpleConfig.for(:application)
  end

  def login_required
    if !session[:user_id]
      respond_to do |format|
        format.html  {
          redirect_to '/auth/tripolis'
        }
        format.json {
          render json: { 'error' => 'Access Denied' }, status: 411
        }
      end
    end
  end

  protected

  def auth_token
    credentials['auth_token']
  end

  def set_token
    Thread.current[:auth_token] = auth_token
    r = yield
    Thread.current[:auth_token] = nil
    r
  end
end
