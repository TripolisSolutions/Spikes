class DashboardController < ApplicationController
  has_widgets do |root|
    root << widget(:header)
    root << widget(:sidebar)
    root << widget(:main)
    # In contrast to the manual, you can not add children to a container here.
  end

  def index
  end
end