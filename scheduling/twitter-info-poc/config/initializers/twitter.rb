Twitter.configure do |config|
  c = SimpleConfig.for :twitter
  # Tripolis Social app consumer key and secret
  config.consumer_key = c.consumer_key
  config.consumer_secret = c.consumer_secret
  #oauth_tolker and oauth_token_secret are use based
end
