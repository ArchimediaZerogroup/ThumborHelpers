module ThumborHelper
  class Railtie < Rails::Railtie

    config.to_prepare do
      Alchemy::Picture.prepend ThumborHelpers::AlchemyOverrides::Picture
    end

    # config.after_initialize do
    #
    # end
  end
end
