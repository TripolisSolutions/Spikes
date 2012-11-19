SimpleConfig.for(:application) do
end

SimpleConfig.for(:backend) do
  set :backend_server, "http://172.16.16.242:3001"
end

SimpleConfig.for(:auth) do
  set :site, "http://172.16.16.242:4000"
  set :app_id, 's3dwp4jmiv5vq5vstkdhq1tm1bxua8w'
  set :app_secret, '22xos9c4k5t60idywzalqja9qjcj8mf'
end
