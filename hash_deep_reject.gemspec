# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_deep_reject/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_deep_reject"
  spec.version       = HashDeepReject::VERSION
  spec.authors       = ["Tieg Zaharia", "Aaron Suggs", "Kyle Burckhard"]
  spec.email         = ["aaron@ktheory.com"]

  spec.summary       = %q{Hash#deep_reject! method}
  spec.description   = %q{Add a Hash#deep_reject! method}
  spec.homepage      = "https://github.com/kickstarter/hash_deep_reject"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license = "MIT"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "shoulda"

end
