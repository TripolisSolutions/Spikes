class ShellApplicationController < ActionController::Base
    has_widgets do |root|
      root << widget(:header)
      root << widget(:sidebar)
    end

    layout "shell"
end