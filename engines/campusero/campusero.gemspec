$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "campusero/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "campusero"
  s.version     = Campusero::VERSION
  s.authors     = ["Flavio Junior"]
  s.email       = ["flpgjr@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Campusero."
  s.description = "Description of Campusero."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.6"
  s.add_dependency "active_model_serializers"

  s.add_development_dependency "sqlite3"
end
