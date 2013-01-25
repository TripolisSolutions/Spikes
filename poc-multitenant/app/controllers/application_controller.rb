class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :select_shard

  helper_method :current_shard

  protected
  def select_shard(&block)
    if current_shard == :master
      logger.info "No shard setted up"
      block.call
    else
      p env
      setup_shard(current_shard)
      logger.info "Using shard: #{current_shard}"
      Octopus.using(current_shard, &block)
    end
  end

  def current_shard
    session[:shard] || :master
  end

  def current_shard=(shard)
    session[:shard] = shard
  end

  def setup_shard(shard)
    return if shard == :master

    Octopus.setup do |config|
      shards = {
        master: default_shard_config,
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
