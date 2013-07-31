require 'capistrano/dsl/rbenv'
self.extend Capistrano::DSL::Rbenv

SSHKit::Backend::Netssh.send(:include, Capistrano::DSL::Rbenv)

load File.expand_path("../tasks/rbenv.rake", __FILE__)
