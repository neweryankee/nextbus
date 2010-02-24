module Nextbus
  class Direction

    include InstantiateWithAttrs
    include AttrWithDefault

    attr_accessor :tag, :title, :name, :route, :reports => [], :stops => []

    def self.all(agency_id, route_id)
      Nextbus.client.directions(agency_id, route_id).map{|direction| new(direction) }
    end

    def self.find(agency_id, route_id, id)
      all(agency_id, route_id).detect{|direction| direction.tag == id }
    end

  end
end