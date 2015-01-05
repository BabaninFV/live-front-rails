# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'live_front/version'

Gem::Specification.new do |spec|
  spec.name          = 'live-front-rails'
  spec.version       = LiveFront::VERSION
  spec.authors       = ['Andrey Krivko']
  spec.email         = ['jastkand@gmail.com']
  spec.summary       = %q{Useful helpers used at Live Typing}
  spec.description   = %q{Useful helpers used at Live Typing}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '~> 4.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rspec-mocks', '~> 3.1.0'
end
