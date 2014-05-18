#!/usr/bin/env ruby

# set load path
$: << File.join(File.expand_path(File.dirname($0)), '..', 'lib')

# set our Gemfile
ENV['BUNDLE_GEMFILE'] = File.join(File.expand_path(File.dirname($0)), '..', 'Gemfile')

require 'bundler'
Bundler.setup

require 'alien_store_cli'

# run application
AlienStoreCLI.start
