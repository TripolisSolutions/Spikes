class Idea < ActiveRecord::Base
  attr_accessible :liked, :text, :user_id

  belongs_to :user

  validates_presence_of :text

end
