require "thumbor_helpers/version"
require "thumbor_helpers/config"
require "thumbor_helpers/alchemy_overrides/picture"
require "thumbor_helpers/railtie" if defined?(Rails::Railtie)

module ThumborHelpers
  class Error < StandardError; end

  @@config = ThumborHelpers::Config.new

  ##
  # Setup della gemma
  def self.setup
    yield @@config

    @@config.reconfigure_thumbor
  end

  # @return [ThumborHelpers::Config]
  def self.config
    @@config
  end
end
