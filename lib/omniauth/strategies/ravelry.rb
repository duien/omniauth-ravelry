require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ravelry < OmniAuth::Strategies::OAuth2
      option :name, 'ravelry'
      option :client_options, {
        :site => 'https://www.ravelry.com',
        :token_url => '/oauth/request_token'
      }

      uid{ raw_info['uid'] }

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'location' => "#{raw_info['city']}, #{raw_info['state']}"
        }
      end

      extra do
        {
          'raw_info' => raw_info,
          #'authorizations' => authorizations
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :oauth_token
      
        @raw_info ||= {} # access_token.get('/api/profile.json').parsed['data']
      end
      
      # def authorizations
      #   access_token.options[:mode] = :query
      #   access_token.options[:param_name] = :oauth_token
      # 
      #   @authorizations ||= access_token.get('/api/authorizations.json').parsed['data']
      # end

    end
  end
end