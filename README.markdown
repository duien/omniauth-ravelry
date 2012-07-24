# Omniauth strategy for Ravelry

This is the unofficial OmniAuth strategy for authenticating to Ravelry. To use it, you'll need to request an OAuth2 key and secret . See the [Ravlery API Group](http://www.ravelry.com/groups/ravelry-api) for more info on getting one.

## Basic usage

Add this line to your application's Gemfile:

    gem 'omniauth-ravelry'


Set up your strategy:

    use OmniAuth::Builder do
      provider :ravelry, ENV['RAVELRY_KEY'], ENV['RAVELRY_SECRET']
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
