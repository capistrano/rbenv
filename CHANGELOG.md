# [master][]

* Your contribution here!

# [2.1.6][] (14 Jan 2020)

* [#89](https://github.com/capistrano/rbenv/pull/89): Revert [#88](https://github.com/capistrano/rbenv/pull/88) Fix issue with sshkit escaping `$HOME`

# [2.1.5][] (14 Jan 2020)

* [#88](https://github.com/capistrano/rbenv/pull/88): Fix issue with sshkit escaping `$HOME`

# [2.1.4][] (8 Sep 2018)

* [#82](https://github.com/capistrano/rbenv/pull/82): Specify MIT license in gemspec

# [2.1.3][] (11 Nov 2017)

* [#75](https://github.com/capistrano/rbenv/pull/75): Enforce uniqueness of rbenv_map_bins.

# [2.1.2][] (29 Sep 2017)

* [#74](https://github.com/capistrano/rbenv/pull/74): Clarify the location where the ruby is missing - [@creitve](https://github.com/creitve)

# [2.1.1][] (14 Apr 2017)

* [#70](https://github.com/capistrano/rbenv/pull/70): Improve log message when rbenv_ruby is not set - [@ivanovaleksey](https://github.com/ivanovaleksey)

# [2.1.0][] (4 Dec 2016)

* Make rbenv_ruby optional [#61](https://github.com/capistrano/rbenv/issues/61), [#67](https://github.com/capistrano/rbenv/pull/67)

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


[master]: https://github.com/capistrano/rbenv/compare/v2.1.6...HEAD
[2.1.6]: https://github.com/capistrano/rbenv/compare/v2.1.5...v2.1.6
[2.1.5]: https://github.com/capistrano/rbenv/compare/v2.1.4...v2.1.5
[2.1.4]: https://github.com/capistrano/rbenv/compare/v2.1.3...v2.1.4
[2.1.3]: https://github.com/capistrano/rbenv/compare/v2.1.2...v2.1.3
[2.1.2]: https://github.com/capistrano/rbenv/compare/v2.1.1...v2.1.2
[2.1.1]: https://github.com/capistrano/rbenv/compare/v2.1.0...v2.1.1
[2.1.0]: https://github.com/capistrano/rbenv/compare/v2.0.4...v2.1.0
