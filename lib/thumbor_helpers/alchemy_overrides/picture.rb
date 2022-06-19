module ThumborHelpers
  module AlchemyOverrides
    ##
    # Override Alchemy::Picture
    module Picture

      def url(options = {})
        url = super(options)

        if ThumborHelpers.config.enabled?
          escaped = CGI.escape("#{ThumborHelpers.config.image_root_host}#{url}")
          encrypted_request = ThumborHelpers.config.cripto_generator.generate(image: escaped)
          "#{ThumborHelpers.config.server_url}#{encrypted_request}"
        else
          url
        end
      end

    end
  end
end