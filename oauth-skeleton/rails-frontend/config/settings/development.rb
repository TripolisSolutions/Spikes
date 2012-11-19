SimpleConfig.for(:application) do
end

SimpleConfig.for(:backend) do
  set :backend_server, "http://127.0.0.1:3001"
end

SimpleConfig.for(:auth) do
  set :auth_server, "http://127.0.0.1:4000"
  set :app_id, 's3dwp4jmiv5vq5vstkdhq1tm1bxua8w'
  set :app_secret, '22xos9c4k5t60idywzalqja9qjcj8mf'
end
