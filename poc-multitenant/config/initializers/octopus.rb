Octopus.setup do |config|
  config.shards = {
    default: Octopus::Proxy.new.config,
  }
  config.environments = [Rails.env]
end

