class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :populate_user

  protected

  def populate_user
    uid =  request.headers['X-User']
    #return render text: "Access denied", status: :unauthorized unless uid
    @user_id = uid.try(:to_i)
  end

  def user_info
    @user_info ||= fetch_user_info(@user_id)
    @user_info
  end

  def fetch_user_info(user_id)
    User.find(user_id) if user_id
  end

  def app_config
    SimpleConfig.for(:app)
  end

  def auth_config
    SimpleConfig.for(:auth)
  end
end
