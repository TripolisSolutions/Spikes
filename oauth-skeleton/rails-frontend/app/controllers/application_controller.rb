class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :set_user_id

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

  def set_user_id
    BackendModel.user_id = session[:user_id] || uid
    r = yield
    BackendModel.user_id = nil
    r
  end
end
