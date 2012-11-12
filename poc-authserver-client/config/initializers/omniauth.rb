APP_ID = 'ktyplvtr3a2vgrjoph5vt2jri1utqls'
APP_SECRET = 'f0iyyyh83xbvd5hssp181mtm1e2x8nu'

# Update your custom Omniauth provider URL here
CUSTOM_PROVIDER_URL = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tripolis, APP_ID, APP_SECRET,:scope => 'users'
  on_failure do |env|
    message_key = env['omniauth.error.type']
    origin = env['omniauth.origin'].split('?').last
    new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}&#{origin}"
    [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
  end
end