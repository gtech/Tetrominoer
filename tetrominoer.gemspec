# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.name        = "tetrominoer"
  spec.version     = "0.0.1"
  spec.authors     = ["William Duncan"]
  spec.email       = ["will@aeondynamicspec.com"]
  spec.homepage    = "https://github.com/gtech/Tetrominoer"
  spec.summary     = %q{Solves Tetrominoe Puzzles}
  spec.description = %q{Uses Knuth's dancing links algorithm to quickly solve the tetronimo puzzles from 'The Talos Principle'}

  spec.add_development_dependency "rspec", "~> 2.5.0"
  spec.add_development_dependency "pry"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
