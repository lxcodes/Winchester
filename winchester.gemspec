# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'winchester/version'

Gem::Specification.new do |spec|
  spec.name          = "winchester"
  spec.version       = Winchester::VERSION
  spec.authors       = ["Alexander"]
  spec.email         = ["alexa@fh-group.com"]
  spec.description   = "Blah Blash?"
  spec.summary       = "Ughhh"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency                  'celluloid', '>= 0.15.1'
  spec.add_dependency                  'timers'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
