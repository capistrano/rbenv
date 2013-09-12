# Capistrano::rbenv

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano', github: 'capistrano/capistrano', branch: 'v3'
    gem 'capistrano-rbenv', github: "capistrano/rbenv"

And then execute:

    $ bundle --binstubs
    $ cap install

## Usage

    # Capfile

    require 'capistrano/rbenv'

    set :rbenv_type, :user # or :system, depends on your rbenv setup
    set :rbenv_ruby, '2.0.0-p247'

If your rbenv is located in some custom path, you can use `rbenv_custom_path` to set it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
