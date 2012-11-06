class User < ActiveRecord::Base
  attr_accessible :avatarUrl, :description, :location, :name, :realName, :userId

  def self.from_omniauth(auth)
    user = where(auth["uid"]).first || create_from_omniauth(auth)
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
    user.save!
    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.userId = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.realName = auth["info"]["name"]
      user.location = auth["info"]["location"]
      user.avatarUrl = auth["info"]["image"]
      user.description = auth["info"]["description"]
    end
  end

  # Initialize Twitter client for the user
  def twitter
      @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
  end

end
