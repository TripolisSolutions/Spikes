class Idea < ActiveRecord::Base
  attr_accessible :liked, :text, :user_id
end
