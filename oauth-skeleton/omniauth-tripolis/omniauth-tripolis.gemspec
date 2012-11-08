# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-tripolis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Borovsky"]
  gem.email         = ["aborovsky@tripolis.com"]
  gem.description   = %q{OmniAuth strategy for Tripolis Social.}
  gem.summary       = %q{OmniAuth strategy for Tripolis Social.}
  gem.homepage      = "https://github.com/TripolisSolutions/Spikes"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-tripolis"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Tripolis::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
