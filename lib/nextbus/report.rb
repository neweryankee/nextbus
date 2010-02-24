module Nextbus
  class Report

    include InstantiateWithAttrs
    include AttrWithDefault

    attr_accessor :lat, :lon, :heading, :time, :vehicle, :direction

  end
end