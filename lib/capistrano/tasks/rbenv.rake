namespace :deploy do
  before :starting, :hook_rbenv_bins do
    invoke :'rbenv:check'

    map_bins = fetch(:rbenv_map_bins) || %w{ruby rake gem bundle}
    SSHKit.config.command_map = Hash.new do |hash, key|
      if map_bins.include?(key.to_s)
        hash[key] = "#{rbenv_path}/versions/#{ruby_version}/bin/#{key}"
      else
        hash[key] = key
      end
    end

    rbenv_method
  end

end

namespace :rbenv do
  task :check do
    # here rbenv_path method works
    on roles(:all) do
      # here it doesn't:
      # undefined local variable or method `rbenv_path' for #<SSHKit::Backend::Netssh:0x007fa011cd3ff8>
      begin
        capture(:ls, rbenv_ruby_dir)
      rescue
        error "rbenv: #{rbenv_ruby_version} is not installed or not found in #{rbenv_path}"
        exit 1
      end
    end
  end
end