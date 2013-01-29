class NavigationWidget < Apotomo::Widget

  helper_method :signed_in?

  def display
    render
  end

  def signed_in?
    parent_controller.signed_in?
  end

end
