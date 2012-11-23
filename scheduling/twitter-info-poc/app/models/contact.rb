class Contact < ActiveRecord::Base
  attr_accessible :avator_url, :description, :location, :name, :real_name

  has_many :user_followers_contacts
  has_many :user_followers, through: :user_followers_contacts

  def self.for_uid(uid)
    where(uid: uid).first_or_create
  end

  def from_twitter(attrs)
    self.name = attrs[:screen_name]
    self.location = attrs[:location]
    self.avator_url = attrs[:profile_image_url]
    self.real_name = attrs[:name]
    self.description = attrs[:description]
    self.followers_count = attrs[:followers_count]
    self.last_update = Time.now
  end
end
