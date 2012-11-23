class UserFollower < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :user_followers_contacts
  has_many :contacts, through: :user_followers_contacts
  
  has_one :contact, foreign_key: :uid, primary_key: "twitter_id"

  def self.for_user(uid)
    where(user_id: uid)
  end

  after_create do
    Contact.for_uid(self.twitter_id)
  end
end
