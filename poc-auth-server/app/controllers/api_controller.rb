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
end
