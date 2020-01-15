namespace :rbenv do
  task :validate do
    on release_roles(fetch(:rbenv_roles)) do |host|
      rbenv_ruby = fetch(:rbenv_ruby)
      if rbenv_ruby.nil?
        info 'rbenv: rbenv_ruby is not set; ruby version will be defined by the remote hosts via rbenv'
      end

      # don't check the rbenv_ruby_dir if :rbenv_ruby is not set (it will always fail)
      unless rbenv_ruby.nil? || (test "[ -d #{fetch(:rbenv_ruby_dir)} ]")
        warn "rbenv: #{rbenv_ruby} is not installed or not found in #{fetch(:rbenv_ruby_dir)} on #{host}"
        exit 1
      end
    end
  end

  task :map_bins do
    SSHKit.config.default_env.merge!({ rbenv_root: fetch(:rbenv_path), rbenv_version: fetch(:rbenv_ruby) })
    rbenv_prefix = fetch(:rbenv_prefix, proc { "#{fetch(:rbenv_path)}/bin/rbenv exec" })
    SSHKit.config.command_map[:rbenv] = "#{fetch(:rbenv_path)}/bin/rbenv"

    fetch(:rbenv_map_bins).uniq.each do |command|
      SSHKit.config.command_map.prefix[command.to_sym].unshift(rbenv_prefix)
    end
  end
end

Capistrano::DSL.stages.each do |stage|
  after stage, 'rbenv:validate'
  after stage, 'rbenv:map_bins'
end

namespace :load do
  task :defaults do
    set :rbenv_path, -> {
      rbenv_path = fetch(:rbenv_custom_path)
      rbenv_path ||= if fetch(:rbenv_type, :user) == :system
        '/usr/local/rbenv'
      else
        '$HOME/.rbenv'
      end
    }

    set :rbenv_roles, fetch(:rbenv_roles, :all)

    set :rbenv_ruby_dir, -> { "#{fetch(:rbenv_path)}/versions/#{fetch(:rbenv_ruby)}" }
    set :rbenv_map_bins, %w{rake gem bundle ruby rails}
  end
end
