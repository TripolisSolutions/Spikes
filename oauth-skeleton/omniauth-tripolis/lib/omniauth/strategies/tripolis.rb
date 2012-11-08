require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Tripolis < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'http://127.0.0.1:4000',
        :authorize_path => '/login/oauth/authorize',
        :token_path => '/login/oauth/access_token'
      }
      option :name, "tripolis"

      def request_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['login'],
          'email' => email,
          'name' => raw_info['name'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/user').parsed
      end

      def email
        raw_info['email'] || (email_access_allowed? ? emails.first : nil)
      end

      def emails
        access_token.options[:mode] = :query
        @emails ||= access_token.get('/user/emails').parsed
      end

      def email_access_allowed?
        options['scope'] && !(options['scope'] == 'public')
      end

    end
  end
end

OmniAuth.config.add_camelization 'tripolis', 'Tripolis'
