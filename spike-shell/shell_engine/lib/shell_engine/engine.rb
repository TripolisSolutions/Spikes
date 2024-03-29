module ShellEngine
  class Engine < ::Rails::Engine
    require "navigasmic"
    require "apotomo"
    require "simple_form"
    require "haml"
    require "cancan"
    initializer 'shell_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include SessionsHelper
      end
    end
  end
end
