class DashboardController < ApplicationController

  # Here we specify the main content. The dashboard could use a combination of widget, both from
  # the shell engine as well as the host application.
  has_widgets do |root|
    root << widget(:main)
    # on dashboard remove hosts subnavigation and replace with generic dashboard navigation
    # hosts can include dashboard content in main or sidebar
    root.remove!(root.childrenHash[:subnavigation])
    root << widget(:subnavigation)
    root.childrenHash[:subnavigation] << widget(:dashboard_navigation)
  end

  def index

  end

end