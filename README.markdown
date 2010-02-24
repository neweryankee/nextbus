nextbus
===========

A simple client for the [NextBus](http://www.nextbus.com) API, including arrival predictions for public transportation based on "real-time" data. As of this writing, data is available for the San Francisco Muni, Portland Streetcar, Massachusetts Institute of Technology and MBTA.

Installation
============

As simple as:

    gem install nextbus

Sample Usage
============

    require 'rubygems'
    require 'nextbus'
    Nextbus::Agency.all
    # => [#<Nextbus::Agency:0x1050428 @tag="mbta", @region_title="Massachusetts", @title="MBTA">, ...]
    Nextbus::Agency.find('mbta')
    # => #<Nextbus::Agency:0x10256d8 @tag="mbta", @region_title="Massachusetts", @title="MBTA">
    Nextbus::Route.all('mbta')
    # => [#<Nextbus::Route:0x5440c0 @tag="39", @title="39">, ...]
    Nextbus::Stop.all('mbta', '39', 'out')
    # => [#<Nextbus::Stop:0x1c3bd78 @tag="23391">, ...]
    Nextbus::Prediction.all('mbta', '39', '23391')
    # => [#<Nextbus::Prediction:0x1cfaebc @time=Wed Feb 24 09:24:00 -0500 2010>, ...]

Copyright
---------

**nextbus** is Copyright (c) 2010 [Greg Sterndale](http://gregsterndale.com). See LICENSE for details.

The nextbus gem is not affiliated with NextBus, Inc.
