class NavigationWidget < Apotomo::Widget

  helper_method :can?

  helper_method :signed_in?

  def display
    render
  end

  def signed_in?
    parent_controller.signed_in?
  end

  def can?(action, object)
    current_ability.can? action, object
  end

  def current_ability
    ::Ability.new parent_controller.current_user
  end

end
