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
          'name'        => raw_info['first_name'],
          'location'    => raw_info['location'],
          'nickname'    => raw_info['username'],
          'first_name'  => raw_info['first_name'],
          'description' => raw_info['about_me'],
          'image'       => raw_info['small_photo_url']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("https://api.ravelry.com/people/#{uid}.json").body)['user']
      end

    end
  end
end
