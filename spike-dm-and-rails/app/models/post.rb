require 'dm-timestamps'

class Post

  include DataMapper::Resource

  property :id, Serial

  property :title, String, :required => true, :length => 0..100
  property :text, Text, :required => true, :length => 0..500

  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

  has n, :comments

end
