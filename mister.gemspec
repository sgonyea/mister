# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mister/version"

Gem::Specification.new do |s|
  s.name        = "mister"
  s.version     = Mister::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Scott Gonyea"]
  s.email       = ["me@sgonyea.com"]
  s.homepage    = 'http://github.com/sgonyea/mister'
  s.summary     = %q{Mister MR.}
  s.description = %q{Mister helps you organize your MapReduce javascripts.}

  s.has_rdoc      = true
  s.add_dependency  'yard'

  s.add_development_dependency 'rspec', '~>2.5'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
