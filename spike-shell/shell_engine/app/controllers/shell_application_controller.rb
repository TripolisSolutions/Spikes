class ShellApplicationController < ActionController::Base

  include SessionsHelper

  before_filter :set_view_path

  has_widgets do |root|
      root << widget(:header)
      root << widget(:session)
      root << widget(:theme_select)
      root << widget(:sidebar)
  end

  layout :active_theme

  def set_view_path
    # themes can provide custom implementations for views, if not, the default will be used
    prepend_view_path "#{Rails.root}/app/views/themes/#{active_theme}"
    prepend_view_path "#{ShellEngine::Engine.root}/app/views/themes/#{active_theme}"
  end

end