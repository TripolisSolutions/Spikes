OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  c = SimpleConfig.for :twitter
  provider :twitter, c.consumer_key, c.consumer_secret
end
