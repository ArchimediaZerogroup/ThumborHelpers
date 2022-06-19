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

    def initialize
      @enabled = false
      reconfigure_thumbor
    end

    def reconfigure_thumbor
      @cripto_generator = Thumbor::CryptoURL.new(@security_key)
      nil
    end

    alias enabled? enabled

  end
end
