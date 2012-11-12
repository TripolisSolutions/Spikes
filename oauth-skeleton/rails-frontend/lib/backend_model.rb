require_relative "backend_connection"

class BackendModel < ActiveRessource::Base
  self.site = config.backend_site
  self.auth_type = :oauth2

  def connection(refresh = false)
    @connection = BackendConnection.new if refresh || @connection.nil?
    @connection.token = Thread.current[:auth_token]

    super(false)
  end

  def config
    SimpleConfig.for(:backend)
  end
end
