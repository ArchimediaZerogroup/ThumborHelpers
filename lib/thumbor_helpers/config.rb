require 'ruby-thumbor'

module ThumborHelpers
  class Config

    ##
    # Identifica l'host di thumbor
    # @return [String]
    # ES:
    # https://thumbor.archimedianet.it
    attr_accessor :server_url

    ##
    # Chiave per generare l'url correttamente criptato per thumbor
    # @return [String]
    attr_accessor :security_key
    
    ##
    # Definisce se l'override è attivo o meno
    # @return [Boolean]
    attr_accessor :enabled

    ##
    # Dominio dove andare a cercare l'immagine
    # @return [String]
    attr_accessor :image_root_host

    attr_reader :cripto_generator

    ##
    # RegExp match to enable thumbor images
    # @return [Regexp] -> default (.*\.jpe?g|.*\.png)
    attr_accessor :allowed_image_extensions

    def initialize
      @enabled = false
      @allowed_image_extensions = /(.*\.jpe?g|.*\.png)/
      reconfigure_thumbor
    end

    def reconfigure_thumbor
      @cripto_generator = Thumbor::CryptoURL.new(@security_key)
      nil
    end

    alias enabled? enabled

  end
end
