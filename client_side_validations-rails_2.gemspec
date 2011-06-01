# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "client_side_validations-rails_2/version"

Gem::Specification.new do |s|
  s.name        = "client_side_validations-rails_2"
  s.version     = ClientSideValidations::Rails2::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Cardarella"]
  s.email       = ["bcardarella@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Client Side Validations support for Rails 2.x}
  s.description = %q{Client Side Validations support for Rails 2.x}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activesupport', '~> 2.3.0'
  s.add_dependency 'client_side_validations', '~> 3.0.4'

  s.add_development_dependency 'rspec', '~> 2.6.0'
end
