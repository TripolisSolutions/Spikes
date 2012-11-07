class Tweet < ActiveRecord::Base
  attr_accessible :status, :user_id

  belongs_to :user

  validates :user_id, presence: true
  validates :status, presence: true, length: { maximum: 140}

  default_scope order: 'tweets.created_at DESC'

end
