# 2.0.1 (9 Jan 2013)

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
