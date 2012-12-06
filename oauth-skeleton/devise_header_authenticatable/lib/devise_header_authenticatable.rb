# Originally based on:
# https://github.com/socialcast/devise_oauth2_providable/blob/master/lib/devise_oauth2_providable.rb

require 'devise'
require 'devise/header_authenticatable/strategies/header_authenticatable_strategy'
require 'devise/header_authenticatable/models/header_authenticatable'
require 'devise/header_authenticatable/version'

module Devise
end

Devise.add_module(:header_authenticatable, :strategy => true, 
                  :model => 'devise/header_authenticatable/models/header_authenticatable')
