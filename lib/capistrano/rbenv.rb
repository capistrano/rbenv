require 'capistrano/dsl/rbenv'
self.extend Capistrano::DSL::Rbenv

load File.expand_path("../tasks/rbenv.rake", __FILE__)
