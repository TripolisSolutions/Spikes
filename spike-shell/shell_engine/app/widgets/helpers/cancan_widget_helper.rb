module CancanWidgetHelper

  # How I integrated cancan into a widget https://gist.github.com/1028632

  # TODO: use this module to keep it DRY but I (HW) had problems with module include.

  def can?(action, object)
    current_ability.can? action, object
  end

  def current_ability
    ::Ability.new parent_controller.current_user
  end

end
