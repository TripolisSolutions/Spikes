class User < ActiveRecord::Base
  attr_accessible :email, :name, :features

  has_many :ideas
end
