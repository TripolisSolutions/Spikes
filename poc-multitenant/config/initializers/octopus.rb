Octopus.setup do |config|
  def resolve_string_connection(spec)
    ActiveRecord::Base::ConnectionSpecification::Resolver.new(spec, {}).spec.config.stringify_keys
  end

  shards = Hash[Database.all.map{|d| [d.id.to_s, resolve_string_connection(d.url)]}]
  config.shards = {
    all: shards,
  }
  config.environments = [Rails.env]
end
