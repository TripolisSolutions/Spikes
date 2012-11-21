class Contact < ActiveRecord::Base
  attr_accessible :avator_url, :description, :location, :name, :real_name
end
