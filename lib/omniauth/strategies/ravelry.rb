require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Ravelry < OmniAuth::Strategies::OAuth
      option :name, 'ravelry'
      option :client_options,
             { site:              'https://api.ravelry.com',
               authorize_url:     'https://www.ravelry.com/oauth/authorize',
               request_token_url: 'https://www.ravelry.com/oauth/request_token',
               access_token_url:  'https://www.ravelry.com/oauth/access_token' }

      uid{ request.params['username'] }

      info do
        {
          :name => raw_info['name'],
          :location => raw_info['city']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("/people/#{uid}.json").body)
      end

    end
  end
end
