# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-rbenv"
  gem.version       = '2.0.4'
  gem.authors       = ["Kir Shatrov", "Yamashita Yuu"]
  gem.email         = ["shatrov@me.com", "yamashita@geishatokyo.com"]
  gem.description   = %q{rbenv integration for Capistrano}
  gem.summary       = %q{rbenv integration for Capistrano}
  gem.homepage      = "https://github.com/capistrano/rbenv"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'
  gem.add_dependency 'sshkit', '~> 1.3'

end
