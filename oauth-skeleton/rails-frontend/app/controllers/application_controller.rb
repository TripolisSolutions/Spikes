class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :set_token

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

  def auth
    env['omniauth.auth']
  end

  def uid
    auth.try(:uid)
  end

  def auth_token
    auth.try(credentials).try(token)
  end

  def set_token
    BackendModel.auth_token = session[:auth_token] || auth_token
    r = yield
    BackendModel.auth_token = nil
    r
  end
end
