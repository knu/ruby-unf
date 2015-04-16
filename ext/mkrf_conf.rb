#!/usr/bin/env ruby

extdir = File.dirname(__FILE__)

unless defined?(JRUBY_VERSION) || String.method_defined?(:unicode_normalize)
  require 'fileutils'
  require 'rubygems'
  require 'rubygems/command.rb'
  require 'rubygems/dependency_installer.rb'

  Gem::Command.build_args = ARGV

  gemsdir = File.expand_path('gems', extdir)
  installer = Gem::DependencyInstaller.new(install_dir: gemsdir)
  specs = installer.install('unf_ext', '>= 0')

  unf_ext = specs.find { |spec| spec.name == 'unf_ext' }
  FileUtils.cp_r(File.join(unf_ext.gem_dir, 'lib'), File.expand_path('..', extdir))
  FileUtils.rm_rf(gemsdir)
end

File.write(File.expand_path('Rakefile', extdir), <<EOF)
task :default
EOF
