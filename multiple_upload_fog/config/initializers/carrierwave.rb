CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "Rackspace",
    rackspace_api_key: "9909bf863a8b083ce6e1e06297228c4b",
    rackspace_username: "yhvirtualxx1"
  }
  config.fog_directory = "images"
end
