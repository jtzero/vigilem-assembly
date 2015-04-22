# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vigilem/assembly/version'

Gem::Specification.new do |spec|
  spec.name                      = 'vigilem-assembly'
  spec.version                   = Vigilem::Assembly::VERSION
  spec.required_rubygems_version = '> 2.0.14' if spec.respond_to? :required_rubygems_version=
  spec.authors                   = ['jtzero511']
  spec.email                     = ['jtzero511@gmail.com']
  spec.summary                   = %q{Provides facitlities to Assemble together the Vigilem gems}
  spec.description               = %q{Provides facitlities to Assemble together the Vigilem gems}
  spec.homepage                  = 'http://rubygems.org/gems/vigilem-support'
  spec.license                   = 'MIT'
  
  spec.add_dependency 'vigilem-core'
  spec.add_dependency 'vigilem-evdev-stat'
  spec.add_dependency 'vigilem-win32_api-stat'
  
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rspec-given'
  spec.add_development_dependency 'turnip'
  spec.add_development_dependency 'guard-rspec'
  
  spec.files         = Dir['{lib,spec,ext,test,features,bin}/**/**'] + ["LICENSE.txt"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
