
Rails.application.config.middleware.use OmniAuth::Builder do
  c = SimpleConfig.for :auth
  provider :tripolis, c.app_id, c.app_secret, scope: 'users', client_options: {site: c.auth_server}
  on_failure do |env|
    message_key = env['omniauth.error.type']
    origin = (env['omniauth.origin'] || '').split('?').last
    new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}&#{origin}"
    [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
  end
end
