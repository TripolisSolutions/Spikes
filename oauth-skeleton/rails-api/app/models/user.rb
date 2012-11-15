class User < ActiveResource::Base
  def self.config
    SimpleConfig.for(:auth)
  end

  self.site = config.site
end
