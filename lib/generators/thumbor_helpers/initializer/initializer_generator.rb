module ThumborHelpers
  class InitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def copy_initializer_file
      copy_file "initializer.rb", "config/initializers/thumbor_helpers.rb"
    end

  end
end
