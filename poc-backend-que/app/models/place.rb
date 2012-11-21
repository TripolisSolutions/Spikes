class Place < ActiveRecord::Base

  belongs_to :user

  attr_accessible :country, :name, :place_type, :woeid

  validates :user_id, presence: true

  default_scope order: 'places.name ASC'

end
