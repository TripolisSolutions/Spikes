require 'dm-timestamps'

class Comment

  include DataMapper::Resource
  property :id,     Serial
  property :comment, Text, :required => true, :length => 0..200

  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

end