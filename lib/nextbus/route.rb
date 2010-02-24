module Nextbus
  class Route

    include InstantiateWithAttrs
    include AttrWithDefault

    attr_accessor :tag, :title, :agency, :directions => []

    def self.all(agency_id)
      Nextbus.client.routes(agency_id).map{|agency| new(agency) }
    end

    def self.find(agency_id, id)
      new Nextbus.client.route(agency_id, id)
    end

  end
end