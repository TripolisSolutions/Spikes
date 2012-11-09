module UaTools

  class OperatingSystem
    # To change this template use File | Settings | File Templates.

    # platform, e.g. 'Windows'
    # name, e.g. 'Windows 8'
    # version, e.g. '8.0.1'
    # device, e.g. :desktop

    attr_reader :platform, :device

    def initialize(user_agent_string)
      @platform, @device = detectDevice(user_agent_string)
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

    def desktop?
      @device == :desktop
    end

    def webtv?
      @device == :webtv
    end

    private

      def detectDevice string
        case string
          when /windows nt/i                                    ; return :windows, :desktop
          when /ipad/i                                          ; return :ios, :tablet
          when /iphone/i                                        ; return :ios, :mobile
          when /mac os x/i                                      ; return :macosx, :desktop
          when /(android).*(mobile safari)/i                    ; return :android, :mobile
          when /(android).*(?<!online|large screen).(safari)/i  ; return :android, :tablet
          when /googletv/i                                      ; return :android, :tv
          else                                                  ; return :unknown, :unknown
        end
      end

  end

end