require 'ua-tools/user_agent'
require 'ua-tools/operating_system'

module UaTools

  VERSION = "0.1.0"

  def self.logger
    @logger ||= (rails_logger || default_logger)
  end

  def self.default_logger
    require 'logger'
    l = Logger.new(STDOUT)
    l.level = Logger::INFO
    l
  end

  def self.logger=(logger)
    @logger = logger
  end

end