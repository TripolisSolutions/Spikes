$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shell_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shell_engine"
  s.version     = ShellEngine::VERSION
  s.authors     = ["Harald Walker"]
  s.email       = ["hwalker@tripolis.com"]
  s.homepage    = "http://www.tripolis.com"
  s.summary     = "TODO: Summary of ShellEngine."
  s.description = "TODO: Description of ShellEngine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "jquery-rails"
  s.add_dependency "apotomo"
  s.add_dependency "haml-rails"
  s.add_dependency "navigasmic"
  s.add_dependency 'uglifier'
  s.add_development_dependency "sqlite3"
end
