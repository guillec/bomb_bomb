# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bomb_bomb/version'

Gem::Specification.new do |spec|
  spec.name          = "bomb_bomb"
  spec.version       = BombBomb::VERSION
  spec.authors       = ["Guille Carlos"]
  spec.email         = ["guille@bitpop.in"]
  spec.description   = %q{Gem for the BombBomb API}
  spec.summary       = %q{Gem for the BombBomb API}
  spec.homepage      = "https://github.com/guillec/bomb_bomb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
