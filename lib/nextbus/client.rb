require 'singleton'
module Nextbus

  def self.client
    Nextbus::Client.instance
  end

  class Client

    include Singleton
    include HTTParty

    base_uri "http://webservices.nextbus.com/service/publicXMLFeed?command="

    def agencies
      response = self.class.do_request("agencyList", {})
      response.agency
    end

    def routes(agency_id)
      response = self.class.do_request("routeList", {"a" => agency_id})
      response.route
    end

    def route(agency_id, route_id)
      response = self.class.do_request("routeConfig", {"a" => agency_id, "r" => route_id})
      response.route
    end

    def predictions(agency_id, route_id, stop_id)
      response = self.class.do_request("predictions", {"a" => agency_id, "r" => route_id, "s" => stop_id})
      response.predictions.direction.prediction
    end

    def vehicles(agency_id, route_id, time=Time.now)
      response = self.class.do_request("vehicleLocations", {"a" => agency_id, "r" => route_id, "t" => time.to_i.to_s})
      response.vehicle
    end

    def directions(agency_id, route_id)
      response = self.class.do_request("routeConfig", {"a" => agency_id, "r" => route_id})
      response.route.direction
    end

    def stops(agency_id, route_id, direction_id)
      response = self.class.do_request("routeConfig", {"a" => agency_id, "r" => route_id})
      response.route.direction.detect{|direction| direction.tag == direction_id }.stop
    end

  protected

    def self.do_request(resource, params)  
      uri = build_uri(resource, params)
      response = get(uri)
      mash_response_body(response)
    end

    def self.build_uri(resource, params)
      params = params.to_a
      params.map!{|pair| pair.join('=') }
      params.unshift(resource)
      params.join('&')
    end

    def self.mash_response_body(response)
      Hashie::Mash.new(response["body"])
    end

  end
end
