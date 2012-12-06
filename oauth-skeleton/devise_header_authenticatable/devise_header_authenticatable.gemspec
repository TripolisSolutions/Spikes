# -*- encoding: utf-8 -*-
require File.expand_path('../lib/devise/header_authenticatable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "devise_header_authenticatable"
  gem.version       = Devise::HeaderAuthenticatable::VERSION
  gem.authors       = ["Alexander Borovsky"]
  gem.email         = ["aborovsky@tripolis.com"]
  gem.summary       = %q{Allows Rails 3 + Devise to authenticate users using headers.}
  gem.description   = %q{Utility gem to load users from authentication server (based on header's information}
  gem.homepage      = "https://github.com/TripolisSolutions/Spikes/oauth-skeleton/devise_header_authenticatable"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency("rails", [">= 3.2.0"])
  gem.add_runtime_dependency("devise", [">= 2.1.0"])
  gem.add_development_dependency('rspec-rails', ['>= 2.6.1'])
  gem.add_development_dependency('sqlite3', ['>= 1.3.5'])
  gem.add_development_dependency('shoulda-matchers', ['>= 1.0.0.beta3'])
  gem.add_development_dependency('factory_girl', ['>= 2.2.0'])
  gem.add_development_dependency('factory_girl_rspec', ['>= 0.0.1'])
  gem.add_development_dependency('rake', ['>= 0.9.2.2'])
  gem.add_development_dependency('webmock', ['>= 1.8.8'])
end
