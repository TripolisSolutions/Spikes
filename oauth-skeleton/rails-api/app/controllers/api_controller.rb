class ApiController < ActionController::Metal

  include ActionController::Helpers
  include ActionController::Redirecting
  include ActionController::Rendering
  include ActionController::Renderers::All
  include ActionController::ConditionalGet

  #need this for responding to different types: json.xml,etc...
  #include ActionController::MimeResponds
  #include ActionController::RequestForgeryProtection

  #need this if your using SSL
  #include ActionController::ForceSSL
  include AbstractController::Callbacks

  #need this to build 'params'
  include ActionController::Instrumentation

  #need this for wrap_parameters
  #include ActionController::ParamsWrapper

  include ActionController::Caching

  
  protected

  def populate_user
    uid =  request.headers['X-User'].to_i
    return render text: "Access denied", status: :unauthorized unless uid
    @user_id = uid.to_i
  end

  def user_info
    @user_info ||= fetch_user_info(@user_id)
    @user_info
  end

  def fetch_user_info(user_id)
    User.find(user_id)
  end

  def app_config
    SimpleConfig.for(:app)
  end

  def auth_config
    SimpleConfig.for(:auth)
  end

end
