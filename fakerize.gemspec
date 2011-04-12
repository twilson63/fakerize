# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'fakerize/version'
 
Gem::Specification.new do |s|
  s.name        = "fakerize"
  s.version     = Fakerize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tom Wilson"]
  s.email       = ["tom@jackhq.com"]
  s.homepage    = "http://github.com/twilson63/fakerize"
  s.summary     = "A CLI Tool to de-identify your data"
  s.description = "Need to protect your production data, but need a sandbox to allow for demos, or experimentation or conversion tests.  This tool will help you create a simple process to take protect user information, while you provide content of demos, or even just local development"
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_development_dependency "rspec"
 
  s.add_dependency "sequel"
  s.add_dependency "faker"
  s.add_dependency "mysql"
  
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.executables  = ['fakerize']
  s.require_path = 'lib'
end

