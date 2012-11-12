class User
  extend Devise::Models
  def self.before_validation(*params); end

  devise :omniauthable, omniauth_providers: [:tripolis]
end
