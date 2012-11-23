class User < ActiveRecord::Base
  attr_accessible :oauth_secret, :oauth_token, :uid
  has_many :user_followers

  def self.from_omniauth(auth)
    user = find_or_create_by_uid(auth["uid"])
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
    user.name = auth["credentials"]["name"]
    user.save!
    Contact.for_uid(auth["uid"])
    user
  end
end
