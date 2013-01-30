module CancanWidgetHelper

  # How I integrated cancan into a widget https://gist.github.com/1028632

  def can?(action, object)
    current_ability.can? action, object
  end

  def current_ability
    ::Ability.new parent_controller.current_user
  end
end