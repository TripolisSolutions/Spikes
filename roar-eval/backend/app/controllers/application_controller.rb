class ApplicationController < ActionController::Metal
  include AbstractController::Logger
  include Rails.application.routes.url_helpers
  include ActionController::UrlFor
  include ActionController::Rendering
  include ActionController::Renderers::All
  include ActionController::MimeResponds
  include ActionController::Head

end
