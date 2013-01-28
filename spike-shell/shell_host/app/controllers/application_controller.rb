class ApplicationController < ShellApplicationController
  protect_from_forgery

  include SessionsHelper

  # According to http://guides.rubyonrails.org/layouts_and_rendering.html layout should
  # be inherited from ShellApplicationController but that's not happening.
  # Have to set it here explicitly or delete default application.html.erb.
  layout :active_theme

  has_widgets do |root|
      # here we add a widget to the sidebar, managed and provided by the Shell engine.
      root.childrenHash[:sidebar] << widget(:aboutme)
  end

end
