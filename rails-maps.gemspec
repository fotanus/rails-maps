$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails-maps/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-maps"
  s.version     = RailsMaps::VERSION
  s.authors     = ["Felipe Tanus"]
  s.email       = ["fotanus@gmail.com"]
  s.homepage    = "https://github.com/fotanus/rails-maps"
  s.summary     = "TODO: Summary of RailsMaps."
  s.description = "TODO: Description of RailsMaps."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
