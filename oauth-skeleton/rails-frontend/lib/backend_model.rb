require_relative "backend_connection"

class BackendModel < ActiveRessource::Base
  self.site = config.backend_site

  class << self
    def headers
      super.merge(auth_headers)
    end

    def auth_token=(token)
      Thread.current[:auth_token] = token
    end

    def auth_token
      Thread.current[:auth_token]
    end

    protected
    def auth_headers
      @auth_headers ||= {
        {'Authentication' => 'Bearer #{auth_token}'}
      }
    end

    def config
      SimpleConfig.for(:backend)
    end

  end
end
