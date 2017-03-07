namespace :rbenv do
  task :validate do
    on release_roles(fetch(:rbenv_roles)) do
      rbenv_ruby = fetch(:rbenv_ruby)
      if rbenv_ruby.nil?
        warn "rbenv: rbenv_ruby is not set"
      end

      # don't check the rbenv_ruby_dir if :rbenv_ruby is not set (it will always fail)
      unless rbenv_ruby.nil? || (test "[ -d #{fetch(:rbenv_ruby_dir)} ]")
        warn "rbenv: #{rbenv_ruby} is not installed or not found in #{fetch(:rbenv_ruby_dir)}"
        exit 1
      end
    end
  end

  task :map_bins do
    SSHKit.config.default_env.merge!({ rbenv_root: fetch(:rbenv_path), rbenv_version: fetch(:rbenv_ruby) })
    rbenv_prefix = fetch(:rbenv_prefix, proc { "#{fetch(:rbenv_path)}/bin/rbenv exec" })
    SSHKit.config.command_map[:rbenv] = "#{fetch(:rbenv_path)}/bin/rbenv"

    fetch(:rbenv_map_bins).each do |command|
      SSHKit.config.command_map.prefix[command.to_sym].unshift(rbenv_prefix)
    end
  end

  task :setup do
    on roles(fetch(:rbenv_roles)) do
      execute :git, 'clone', fetch(:rbenv_git_url), fetch(:rbenv_path)
      execute :git, 'clone', fetch(:ruby_build_git_url), fetch(:ruby_build_path)
    end
  end

  task :update do
    on roles(fetch(:rbenv_roles)) do
      [fetch(:rbenv_path), fetch(:ruby_build_path)].each do |update_path|
        within update_path do
          execute :git, 'pull'
        end
      end
    end
  end

  task :install, [:new_ruby] do |task, args|
    on roles(fetch(:rbenv_roles)) do
      execute :rbenv, 'install', args[:new_ruby] || fetch(:rbenv_ruby)
      execute :rbenv, 'local', args[:new_ruby] || fetch(:rbenv_ruby)
      execute :rbenv, 'rehash'
      execute :gem, 'install', 'bundler' unless fetch(:bundle_roles)
      execute :rbenv, 'rehash'
    end
  end
end

Capistrano::DSL.stages.each do |stage|
  current_tasks = Rake.application.top_level_tasks.join(' ')
  after stage, 'rbenv:validate' if !current_tasks.match(/rbenv.(setup|install)/)
  after stage, 'rbenv:map_bins'
end

namespace :load do
  task :defaults do
    set :rbenv_path, -> {
      rbenv_path = fetch(:rbenv_custom_path)
      rbenv_path ||= if fetch(:rbenv_type, :user) == :system
        "/usr/local/rbenv"
      else
        "$HOME/.rbenv"
      end
    }

    set :rbenv_roles, fetch(:rbenv_roles, :all)

    set :rbenv_ruby_dir, -> { "#{fetch(:rbenv_path)}/versions/#{fetch(:rbenv_ruby)}" }
    set :rbenv_map_bins, %w{rake gem bundle ruby rails}

    set :ruby_build_path, -> { '%s/plugins/ruby-build' % fetch(:rbenv_path) }
    set :rbenv_git_url, 'git://github.com/sstephenson/rbenv.git'
    set :ruby_build_git_url, 'git://github.com/sstephenson/ruby-build.git'
  end
end
