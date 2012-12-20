require 'devise/strategies/base'

# TODO: Specify a failure app that's custom for this strategy.
# If the strategy was valid (because it had an access token in the header or params)
# but it failed, then the responses should be in the 4XX range, not 3XX redirects

module Devise
  module Strategies
    class HeaderAuthenticatable < Authenticatable

      # Return true or false, indicating if this strategy is applicable
      def valid?
        @uid = env['HTTP_X_USER']
        @client_id = env['HTTP_X_CLIENT']
        !!@uid && !!@client_id
      end

      def authenticate!
        resource = mapping.to.find(@uid, params: {client_id: @client_id} )
        if validate(resource)
          success! resource
        elsif !halted?
          fail(:invalid_token)
        end
      end

      # Do not store Header validation in session.
      # This forces the strategy to check the header on every request.
      def store?
        false
      end

    private

      def setup!
        tokens = [access_token_in_header, access_token_in_payload].compact
        return case Array(tokens).size
        when 0
          nil
        when 1
          tokens.first
        else
          invalid_request!('Both Authorization header and payload includes access token.')
        end
      end

      def access_token_in_header
        @auth_header = Rack::Auth::AbstractRequest.new(env)
        if @auth_header.provided? && @auth_header.scheme == :bearer
          @auth_header.params
        else
          nil
        end
      end

      def access_token_in_payload
        params['access_token']
      end

      # Do not use remember_me behavior with token.
      def remember_me?
        false
      end

    end # OauthTokenAuthenticatable
  end # Strategies
end # Devise

Warden::Strategies.add(:header_authenticatable, Devise::Strategies::HeaderAuthenticatable)
