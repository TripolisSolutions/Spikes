class WebNavigationWidget < Apotomo::Widget

  include CancanWidgetHelper
  helper_method :can?

  def display
    render
  end

end
