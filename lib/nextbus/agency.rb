module Nextbus
  class Agency

    include InstantiateWithAttrs
    include AttrWithDefault

    attr_accessor :tag, :title, :short_title, :region_title, :routes => [], :vehicles => []

    def self.all
      Nextbus.client.agencies.map{|agency| new(agency) }
    end

    def self.find(id)
      all.detect{|agency| agency.tag == id }
    end

  end
end
