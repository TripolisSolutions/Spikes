module UaTools

  class OperatingSystem
    # To change this template use File | Settings | File Templates.

    # platform, e.g. 'Windows'
    # name, e.g. 'Windows 8'
    # version, e.g. '8.0.1'
    # device, e.g. :desktop

    attr_reader :platform

    def initialize(user_agent_string)
      @device = :mobile
      @platform = :ios
    end

    def to_s
      @platform.to_s
    end

    def mobile?
      true
    end

  end

end