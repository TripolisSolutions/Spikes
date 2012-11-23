class UserFollowersContact < ActiveRecord::Base
  belongs_to :user_follower
  belongs_to :contact
end
