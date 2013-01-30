class WebNavigationWidget < Apotomo::Widget

  helper_method :can?

  def display
    render
  end

  def can?(action, object)
    current_ability.can? action, object
  end

  def current_ability
    ::Ability.new parent_controller.current_user
  end

end
