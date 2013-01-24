class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :select_shard

  helper_method :current_shard

  protected
  def select_shard(&block)
    setup_shard(current_shard)
    Octopus.using(current_shard, &block)
  end

  def current_shard
    session[:shard] || :default
  end

  def current_shard=(shard)
    session[:shard] = shard
  end

  def setup_shard(shard)
    return if shard == :default

    Octopus.setup do |config|
      shards = {
        default: default_shard_config,
      }
      shards[current_shard] = current_shard if current_shard.kind_of? String

      config.shards = shards
      config.environments = [Rails.env]
    end
    Thread.current[:connection_proxy] = Octopus::Proxy.new
  end

  def default_shard_config
    Octopus::Proxy.new.config
  end
end
