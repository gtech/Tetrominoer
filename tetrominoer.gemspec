# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tetrominoer/version"

Gem::Specification.new do |s|
  s.name        = "tetrominoer"
  s.version     = Tetrominoer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["William Duncan"]
  s.email       = ["will@aeondynamics.com"]
  s.homepage    = "blackeon.net"
  s.summary     = %q{A sample gem}
  s.description = %q{A sample gem. It doesn't do a whole lot, but it's still useful.}

  s.add_runtime_dependency "launchy"
  s.add_development_dependency "rspec", "~>2.5.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
