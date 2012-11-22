class UserFollower < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_and_belongs_to_many :contacts, join_table: "user_followers_contacts"

  def for_user(uid)
    where(user_id: uid)
  end

  after_create do
    Contact.for_uid(self.user_id)
  end
end
