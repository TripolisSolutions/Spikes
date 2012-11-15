class BackendModel < ActiveResource::Base
  class << self
    def headers
      super.merge(auth_headers)
    end

    def user_id=(uid)
      Thread.current[:user_id] = uid
    end

    def user_id
      Thread.current[:user_id]
    end

    protected
    def auth_headers
      @auth_headers ||= {
        'X-User' => user_id
      }
    end

    def config
      SimpleConfig.for(:backend)
    end
  end

  self.site = config.backend_server
end
