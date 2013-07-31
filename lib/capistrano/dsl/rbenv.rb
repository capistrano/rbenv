module Capistrano
  module DSL
    module Rbenv
      USER_RBENV_PATH = "~/.rbenv"
      SYSTEM_RBENV_PATH = "/usr/local/rbenv"

      def rbenv_ruby_dir
        "#{rbenv_path}/versions/#{ruby_version}"
      end

      def rbenv_path
        path = fetch(:rbenv_custom_path)
        path ||= if fetch(:rbenv_type) == "system"
          SYSTEM_RBENV_PATH
        else
          USER_RBENV_PATH
        end

        path
      end

      def rbenv_ruby_version
        fetch(:rbenv_ruby_version)
      end

    end

    end
  end
end
