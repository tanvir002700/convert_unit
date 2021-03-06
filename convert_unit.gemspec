# frozen_string_literal: true
# coding: utf-8
#
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'convert_unit/version'

Gem::Specification.new do |spec|
  spec.name          = 'convert_unit'
  spec.version       = ConvertUnit::VERSION
  spec.authors       = ['tanvir hasan']
  spec.email         = ['tanvir002700@gmail.com']

  spec.summary       = 'A simple unit conversion gem.'
  spec.description   = 'A Ruby Library for dealing with different types of unit conversion, \
                        with Arithmetic operation and comparisons.'
  spec.homepage      = 'https://rubygems.org/gems/convert_unit'
  spec.license       = 'MIT'
  spec.metadata      = { 'source_code_uri' => 'https://github.com/tanvir002700/convert_unit' }

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'coveralls', '~> 0.8.21'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.0'
end
