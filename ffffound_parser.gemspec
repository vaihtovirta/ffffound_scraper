# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffffound_parser/version'

Gem::Specification.new do |spec|
  spec.licenses    = ['MIT']
  spec.name          = 'ffffound_parser'
  spec.version       = FfffoundParser::VERSION
  spec.authors       = ['Emil Shakirov']
  spec.email         = ['5o.smoker@gmail.com']
  spec.homepage      = 'https://github.com/vaihtovirta/ffffound_parser'

  spec.summary       = 'Simple parser for grabing images from ffffound.com'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'nokogiri', '~> 1.6'
  spec.add_development_dependency 'time-lord', '~> 1.0'
end
