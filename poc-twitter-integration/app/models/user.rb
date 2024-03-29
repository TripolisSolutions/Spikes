class User < ActiveRecord::Base
  attr_accessible :avatarUrl, :description, :location, :name, :realName, :uid

  has_many :tweets, dependent: :destroy

  def self.from_omniauth(auth)
    user = find_by_uid(auth["uid"]) || create_from_omniauth(auth)
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
    user.save!
    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
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

  def timeline
    Rails.cache.fetch("timeline/#{id}", expires_in: 15.minutes) do
      twitter.home_timeline
    end
  end

end
