class ApplicationController < ShellApplicationController
  protect_from_forgery

  # According to http://guides.rubyonrails.org/layouts_and_rendering.html layout should
  # be inherited from ShellApplicationController but that's not happening.
  # Have to set it here explicitly or delete default application.html.erb.
  layout "shell"

  has_widgets do |root|
      # here we add a widget to the sidebar, managed and provided by the Shell engine.
      root.childrenHash[:sidebar] << widget("aboutme",  :aboutme)
  end

end
