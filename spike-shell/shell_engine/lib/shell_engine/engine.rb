module ShellEngine
  class Engine < ::Rails::Engine
    require "navigasmic"
    initializer 'shell_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        #helper SessionsHelper
        include SessionsHelper
      end
    end
  end
end
