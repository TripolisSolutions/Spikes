class Client < Songkick::OAuth2::Model::Client
  attr_accessible :name, :redirect_uri
end
