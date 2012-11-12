require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Tripolis < OmniAuth::Strategies::OAuth2

      CUSTOM_PROVIDER_URL = 'http://localhost:3000'

      option :client_options, {
          :site => CUSTOM_PROVIDER_URL,
          :authorize_url => "#{CUSTOM_PROVIDER_URL}/auth/authorize",
          :access_token_url => "#{CUSTOM_PROVIDER_URL}/auth/access_token",
          :request_token_path => '/auth/access_token'
      }

      uid { raw_info['id'] }  #this holds the user id

      info do
        {
            :email => raw_info['info']['email'],
            :name => raw_info['info']['name'],
            :customdb =>  raw_info['info']['customdb']
        }
      end



      def raw_info
        @raw_info ||= access_token.get("/auth/user?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end