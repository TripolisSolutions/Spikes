class DashboardNavigationWidget < Apotomo::Widget

  include CancanWidgetHelper
  helper_method :can?

  def display
    render
  end

  # How I integrated cancan into a widget https://gist.github.com/1028632

end
