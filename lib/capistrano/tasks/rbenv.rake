map_bins = fetch(:rbenv_map_bins) || %w{rake gem bundle ruby}

SSHKit.config.command_map = Hash.new do |hash, key|
  if key.to_s == "bundle"
    hash[key] = "RBENV_VERSION=#{fetch(:rbenv_ruby)} #{rbenv_path}/bin/rbenv exec #{key}"
  elsif map_bins.include?(key.to_s)
    hash[key] = "RBENV_VERSION=#{fetch(:rbenv_ruby)} #{rbenv_path}/bin/rbenv exec bundle exec #{key}"
  else
    hash[key] = key
  end
end

namespace :deploy do
  before :starting, :hook_rbenv_bins do
    invoke :'rbenv:check'
  end
end

namespace :rbenv do
  task :check do
    on roles(:all) do
      rbenv_ruby = fetch(:rbenv_ruby)
      if rbenv_ruby.nil?
        error "rbenv: rbenv_ruby is not set"
        exit 1
      end

      if test "[ ! -d #{rbenv_ruby_dir} ]"
        error "rbenv: #{rbenv_ruby} is not installed or not found in #{rbenv_ruby_dir}"
        exit 1
      end
    end
  end
end

def rbenv_ruby_dir
  "#{rbenv_path}/versions/#{fetch(:rbenv_ruby)}"
end

def rbenv_path
  path = fetch(:rbenv_custom_path)
  path ||= if fetch(:rbenv_type) == "system"
    "/usr/local/rbenv"
  else
    "~/.rbenv"
  end

  path
end
