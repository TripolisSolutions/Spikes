##
# User for access to external applications e.g. social
##
class User < ActiveRecord::Base
  include Songkick::OAuth2::Model::ResourceOwner
  include Songkick::OAuth2::Model::ClientOwner

  attr_accessible :client_id, :password, :username
  #has_many :database_connections

end
