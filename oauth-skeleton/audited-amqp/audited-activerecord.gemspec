# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'audited-amqp'
  gem.version = '3.0.0'

  gem.authors     = ['Brandon Keepers', 'Kenneth Kalmer', 'Daniel Morrison',
                     'Brian Ryckbost', 'Steve Richert', 'Ryan Glover', 'Alexander Borovsky']
  gem.email       = 'aborovsky@tripolis.com'
  gem.description = 'Log all changes to your AMQP'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/TripolisSolutions/Spikes/tree/master/oauth-skeleton/audited_amqp'

  gem.add_dependency 'audited', gem.version
  gem.add_dependency 'activerecord', '~> 3.0'
  gem.add_dependency 'amqp'

  gem.files         = `git ls-files lib`.split($\)
  gem.require_paths = ['lib']
end

