require File.join(File.dirname(__FILE__), '..', 'helper')

class TestVehicle < Test::Unit::TestCase

  def setup
    @vehicle1 = Nextbus::Vehicle.new
  end

  def test_id_attr
    assert_attr_accessor @vehicle1, :id
  end

  def test_agency_attr
    assert_attr_accessor @vehicle1, :agency
  end
  def test_route_attr
    assert_attr_accessor @vehicle1, :route
  end
  def test_reports_attr
    assert_attr_accessor @vehicle1, :reports, []
  end

  def test_instantiated_with_attrs
    attrs = {:id => 'my id'}
    assert_instantiated_with_attrs Nextbus::Vehicle, attrs
  end

  def test_all
    vehicle_id1 = '1022'
    vehicle_id2 = '1041'
    agency_id   = 'abc'
    route_id    = '123'
    expect_response('vehicle_locations.xml', /#{agency_id}.+#{route_id}/, Net::HTTP::Get)
    all = Nextbus::Vehicle.all(agency_id, route_id)
    assert all.is_a?(Array)
    assert_equal 7, all.length
    assert all[0].is_a?(Nextbus::Vehicle)
    assert_equal vehicle_id1, all[0].id
    assert_equal vehicle_id2, all[1].id
  end

  def test_find
    vehicle_id = '1022'
    agency_id  = 'abc'
    route_id   = '123'
    expect_response('vehicle_locations.xml', /#{agency_id}.+#{route_id}/, Net::HTTP::Get)
    vehicle = Nextbus::Vehicle.find(agency_id, route_id, vehicle_id)
    assert vehicle.is_a?(Nextbus::Vehicle)
    assert_equal vehicle_id, vehicle.id
  end

end
