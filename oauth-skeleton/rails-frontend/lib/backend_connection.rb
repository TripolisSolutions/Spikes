require 'activeresource'

class BackendConnection < ActiveResource::Connection
  def token=(token)
    @token = token
  end

  protected
  def legitimize_auth_type(auth_type)
    return auth_type if auth_type == :oauth2

    super
  end

  def authorization_header(http_method, uri)
    return super unless auth_type == :oauth2

    {'Authentication' => 'Bearer #{token}'}
  end
end
