class Ability < Shell_Ability

  include CanCan::Ability

  def initialize(user)

    super(user)

  end
end
