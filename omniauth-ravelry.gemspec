# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/ravelry/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Emily Price"]
  gem.email         = ["price.emily@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Ravelry}
  gem.summary       = %q{OmniAuth strategy for Ravelry}
  gem.homepage      = "http://github.com/duien/omniauth-ravelry"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-ravelry"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Ravelry::VERSION

  gem.add_dependency "omniauth", "~> 1.1.0"
  gem.add_dependency "omniauth-oauth", "~> 1.0.1"
  gem.add_dependency "multi_json"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 2.7"
  gem.add_development_dependency "rack-test"
end
