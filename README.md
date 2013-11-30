# Capistrano::rbenv

This gem provides idiomatic rbenv support for Capistrano 3.x (and 3.x
*only*).

## Please Note

This ```capistrano-rbenv``` repo is different from the current
```capistrano-rbenv``` gem on rubygems.org. You **must** specify
**this github repo** in your Gemfile!

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano', '~> 3.0'
    gem 'capistrano-rbenv', github: "capistrano/rbenv"

And then execute:

    $ bundle install

## Usage

    # Capfile
    require 'capistrano/rbenv'


    # config/deploy.rb
    set :rbenv_type, :user # or :system, depends on your rbenv setup
    set :rbenv_ruby, '2.0.0-p247'
    set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

If your rbenv is located in some custom path, you can use `rbenv_custom_path` to set it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
