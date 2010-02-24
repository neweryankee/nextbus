module Nextbus
  class Prediction

    include InstantiateWithAttrs
    include AttrWithDefault

    attr_accessor :time, :departure, :stop

    def epoch_time=(nanosecs)
      self.time = Time.at(nanosecs.to_i/1000)
    end

    def self.all(agency_id, route_id, stop_id)
      Nextbus.client.predictions(agency_id, route_id, stop_id).map{|prediction| new(prediction) }
    end

  end
end