def bundler_loaded?
  Gem::Specification::find_all_by_name('capistrano-bundler').any?
end

namespace :deploy do
  before :starting, :hook_rbenv_bins do
    invoke :'rbenv:check'
  end
end

Capistrano::DSL.stages.each do |stage|
  after stage, :'rbenv:command_map'
end

namespace :rbenv do
  task :check do
    on roles(:all) do
      rbenv_ruby = fetch(:rbenv_ruby)
      if rbenv_ruby.nil?
        error "rbenv: rbenv_ruby is not set"
        exit 1
      end

      if test "[ ! -d #{fetch(:rbenv_ruby_dir)} ]"
        error "rbenv: #{rbenv_ruby} is not installed or not found in #{fetch(:rbenv_ruby_dir)}"
        exit 1
      end
    end
  end

  task :command_map do
    prefix = "RBENV_ROOT=#{fetch(:rbenv_path)} "    \
             "RBENV_VERSION=#{fetch(:rbenv_ruby)} " \
             "#{fetch(:rbenv_path)}/bin/rbenv exec"
    fetch(:rbenv_map_bins).each do |bin|
      SSHKit.config.command_map[bin.to_sym] = begin
        if bundler_loaded? && bin.to_s != "bundle"
          "#{prefix} bundle exec #{bin}"
        else
          "#{prefix} #{bin}"
        end
      end
    end
  end
end

namespace :load do
  task :defaults do

    set :rbenv_path, -> {
      rbenv_path = fetch(:rbenv_custom_path)
      rbenv_path ||= if fetch(:rbenv_type, :user) == :system
        "/usr/local/rbenv"
      else
        "~/.rbenv"
      end
    }

    set :rbenv_ruby_dir, -> { "#{fetch(:rbenv_path)}/versions/#{fetch(:rbenv_ruby)}" }
    set :rbenv_map_bins, %w{rake gem bundle ruby}
  end
end
