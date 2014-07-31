# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'browserify_sprockets/version'

Gem::Specification.new do |spec|
  spec.name          = "browserify_sprockets"
  spec.version       = BrowserifySprockets::VERSION
  spec.authors       = ["Scott Bader"]
  spec.email         = ["sb@scottbader.org"]
  spec.summary       = %q{Browserify engine for sprockets}
  spec.description   = %q{Browserify engine for sprockets}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "sprockets", "~> 2.12"
end
