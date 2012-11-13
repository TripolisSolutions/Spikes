$:.push File.expand_path("../lib", __FILE__)

require "ua-tools"

Gem::Specification.new do |s|
  s.name         = "ua-tools"
  s.version      = UaTools::VERSION
  s.authors       = ["Harald Walker"]
  s.email        =  ["hwalker@tripolis.com"]
  s.homepage     = "http://www.tripolis.com"
  s.summary      = "Utilities to parse user-agent strings."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'ua-tools' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
