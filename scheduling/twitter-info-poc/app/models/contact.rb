class Contact < ActiveRecord::Base
  attr_accessible :avator_url, :description, :location, :name, :real_name

  has_and_belongs_to_many :user_followers, join_table: "user_followers_contacts"

  def self.for_uid(uid)
    where(uid: uid).first_or_create
  end
end
