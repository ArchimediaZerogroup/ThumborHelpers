module ThumborHelpers
  module AlchemyOverrides
    module Picture

      def url(options = {})
        url = super(options)

        if ThumborHelpers.config.enabled?
          #TODO definire come andare a ricercare il dominio del sito, con il config è un poco limitato
          "https://#{ThumborHelpers.config.server_url}/unsafe/#{CGI.escape("#{ThumborHelpers.config.image_root_host}#{url}")}"
        else
          url
        end
      end

    end
  end
end