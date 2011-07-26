# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "abacus"
  s.version     = '1.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vincent Chu"]
  s.email       = ["vince@posterous-inc.com"]
  s.homepage    = "https://github.com/vincentchu/abacus"
  s.summary     = %q{Easy Redis-based counters for collections of numbers.}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'redis'
end
