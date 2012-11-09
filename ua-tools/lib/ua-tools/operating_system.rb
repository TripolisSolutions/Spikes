module UaTools

  class OperatingSystem
    # To change this template use File | Settings | File Templates.

    # platform, e.g. 'Windows'
    # name, e.g. 'Windows 8'
    # version, e.g. '8.0.1'
    # device, e.g. :desktop

    attr_reader :platform, :device

    def initialize(user_agent_string)
      @device = detectDevice(user_agent_string)
      @platform = :ios
    end

    def to_s
      @platform.to_s
    end

    def mobile?
      @device == :mobile
    end

    def tablet?
      @device == :tablet
    end

    private

      def detectDevice string
        case string
          when /ipad/i    ; :tablet
          when /iphone/i  ; :mobile
          else ; :unknown
        end
      end

  end

end