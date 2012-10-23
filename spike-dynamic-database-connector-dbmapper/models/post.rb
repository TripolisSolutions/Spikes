class Post
  include DataMapper::Resource

  #def self.default_repository_name
  #  :default
  #end

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :body, Text
end
