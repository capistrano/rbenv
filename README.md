# Capistrano::rbenv

This gem provides idiomatic rbenv support for Capistrano 3.x (and 3.x
*only*).

## Please Note

If you want to use this plugin with Cap 2.x, please use 1.x version of the gem.
Source code and docs for older integration is available in [another repo](https://github.com/yyuu/capistrano-rbenv)

Thanks a lot to [@yyuu](https://github.com/yyuu) for merging his gem with official one.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano', '~> 3.1'
    gem 'capistrano-rbenv', '~> 2.0'

And then execute:

    $ bundle install

## Usage

    # Capfile
    require 'capistrano/rbenv'


    # config/deploy.rb
    set :rbenv_type, :user # or :system, depends on your rbenv setup
    set :rbenv_ruby, '2.0.0-p247'

    # in case you want to set ruby version from the file:
    # set :rbenv_ruby, File.read('.ruby-version').strip

    set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
    set :rbenv_map_bins, %w{rake gem bundle ruby rails}
    set :rbenv_roles, :all # default value

If your rbenv is located in some custom path, you can use `rbenv_custom_path` to set it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
