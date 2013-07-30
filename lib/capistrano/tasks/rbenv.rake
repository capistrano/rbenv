namespace :deploy do
  before :starting, :hook_rbenv_bins do
    rbenv_path = fetch(:rbenv_custom_path)
    rbenv_path ||= if fetch(:rbenv_type) == "system"
      "/usr/local/rbenv"
    else
      "~/.rbenv"
    end

    SSHKit.config.command_map = Hash.new do |hash, key|
      if %w{ruby rake gem bundle}.include?(key.to_s)
        hash[key] = "#{rbenv_path}/versions/#{fetch(:rbenv_ruby_version)}/bin/#{key}"
      else
        hash[key] = key
      end
    end
  end
end
