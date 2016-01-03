# 2.0.4 (3 Jan 2016)

* Change default `rbenv_path` to use `$HOME` instead of `~`. This allows
  capistrano-rbenv to work with the new quoting behavior of sshkit 1.8.0.

# 2.0.3 (27 Jan 2015)

* rbenv:validate is a 'success' if version exists #36
* MIT license included
* rbenv command runs only on release_roles #44

# 2.0.2 (29 Jan 2014)

* Environment variables are set with native SSHKit API
* Depend on capistrano 3.1

# 2.0.1 (9 Jan 2014)

* Added ability to setup custom `rbenv_roles` variable (default: :all).
* Fixed SSHKit dependency

# 2.0.0

* Added ability to setup custom `rbenv_prefix` variable.
* prefix rails with rbenv by default
* Switching to new command map (https://github.com/capistrano/sshkit/pull/45)
  This gives us more flexible integration and command mapping.
  Fixed bug when `cap some_task` didn't invoke rbenv hooks.

Capistrano 3 -ready release.

# 1.0.5

Versions < 2.0 are located in another repo: https://github.com/yyuu/capistrano-rbenv
