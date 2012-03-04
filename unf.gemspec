# -*- encoding: utf-8 -*-
require File.expand_path('../lib/unf/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Akinori MUSHA"]
  gem.email         = ["knu@idaemons.org"]
  gem.description   = <<-'EOS'
This is a wrapper library to bring Unicode Normalization Form support
to Ruby/JRuby.
  EOS
  gem.summary       = %q{A wrapper library to bring Unicode Normalization Form support to Ruby/JRuby}
  gem.homepage      = "https://github.com/knu/ruby-unf"
  gem.platform      = defined?(JRUBY_VERSION) ? 'jruby' : Gem::Platform::RUBY

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "unf"
  gem.require_paths = ["lib"]
  gem.version       = UNF::VERSION

  gem.add_dependency 'unf_ext', '>= 0' unless defined?(JRUBY_VERSION)

  gem.add_development_dependency 'shoulda', '>= 0'
  gem.add_development_dependency 'bundler', '~> 1.0.0'
  gem.add_development_dependency 'jeweler', '~> 1.6.4'
  gem.add_development_dependency 'rcov', '>= 0'
end
