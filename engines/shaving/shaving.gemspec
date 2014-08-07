$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shaving/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shaving"
  s.version     = Shaving::VERSION
  s.authors     = ["Josh Ashby"]
  s.email       = ["joshuaashby@joshashby.com"]
  s.homepage    = "https://github.com/JoshAshby"
  s.summary     = "Summary of Shaving."
  s.description = "Description of Shaving."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
end
