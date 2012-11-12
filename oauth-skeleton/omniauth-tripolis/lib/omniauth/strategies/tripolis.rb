require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Tripolis < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'http://127.0.0.1:4000',
      }
      option :name, "tripolis"

      def request_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['login'],
          'name' => raw_info['name'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :oauth_token 
        @raw_info ||= access_token.get('/oauth/user').parsed
      end

      def email_access_allowed?
        options['scope'] && !(options['scope'] == 'public')
      end

    end
  end
end

OmniAuth.config.add_camelization 'tripolis', 'Tripolis'
