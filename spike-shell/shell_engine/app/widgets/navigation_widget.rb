class NavigationWidget < Apotomo::Widget

  include CancanWidgetHelper
  helper_method :can?

  helper_method :signed_in?

  def display
    render
  end

  def signed_in?
    parent_controller.signed_in?
  end

end
