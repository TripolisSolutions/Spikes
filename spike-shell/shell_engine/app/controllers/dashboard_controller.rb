class DashboardController < ApplicationController

  # Here we specify the main content. The dashboard could use a combination of widget, both from
  # the shell engine as well as the host application.
  has_widgets do |root|
    root << widget(:main)
  end

  def index

  end

end