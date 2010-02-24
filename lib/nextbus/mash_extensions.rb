module Hashie

  class Mash < Hashie::Hash

  protected

    def convert_key(key) #:nodoc:
      key.to_s.underscore
    end

  end
end
