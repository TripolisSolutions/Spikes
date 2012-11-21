class UserFollower < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  def for_user(uid)
    where(user_id: uid)
  end

  after_create do
    Contact.for_uid(self.user_id)
  end
end
