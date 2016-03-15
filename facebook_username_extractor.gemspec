# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facebook_username_extractor/version'

Gem::Specification.new do |spec|
  spec.name          = 'facebook_username_extractor'
  spec.version       = FacebookUsernameExtractor::VERSION
  spec.authors       = ['Chris Mytton']
  spec.email         = ['chrism@mysociety.org']

  spec.summary       = 'Tidy up the various forms of Facebook urls'
  spec.homepage      = 'https://github.com/everypolitician/facebook_username_extractor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry', '~> 0.10'
end
