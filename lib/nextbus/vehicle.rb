module Nextbus
  class Vehicle

    include InstantiateWithAttrs
    include AttrWithDefault

    attr_accessor :id, :agency, :route, :reports => []

    def self.all(agency_id, route_id)
      Nextbus.client.vehicles(agency_id, route_id).map{|vehicle| new(vehicle) }
    end

    def self.find(agency_id, route_id, id)
      all(agency_id, route_id).detect{|vehicle| vehicle.id == id }
    end

  end
end