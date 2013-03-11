class Channel
  include Mongoid::Document

  belongs_to :contact

  CHANNEL_TYPE = ['Facebook','Twitter','LinkedIn','Google+']

  field :channel_id, type: Integer
  field :type, type: String

end