require File.join(File.dirname(__FILE__), '..', 'helper')

class TestStop < Test::Unit::TestCase

  def setup
    @stop1 = Nextbus::Stop.new
  end

  def test_tag_attr
    assert_attr_accessor @stop1, :tag
  end
  def test_title_attr
    assert_attr_accessor @stop1, :title
  end
  def test_short_lat_attr
    assert_attr_accessor @stop1, :lat
  end
  def test_region_lon_attr
    assert_attr_accessor @stop1, :lon
  end
  def test_region_id_attr
    assert_attr_accessor @stop1, :id
  end

  def test_direction_attr
    assert_attr_accessor @stop1, :direction
  end
  def test_predictions_attr
    assert_attr_accessor @stop1, :predictions, []
  end

  def test_instantiated_with_attrs
    attrs = {:tag => 'my tag', :title => 'my title', :lat => 'my lat', :lon => 'my lon', :id => 'my id'}
    assert_instantiated_with_attrs Nextbus::Stop, attrs
  end

  def test_all
    stop_tag1     = '23391'
    stop_tag2     = '173'
    agency_id     = 'abc'
    route_id      = '321'
    direction_id  = 'out'
    expect_response('route_config.xml', /#{agency_id}.+#{route_id}/, Net::HTTP::Get)
    all = Nextbus::Stop.all(agency_id, route_id, direction_id)
    assert all.is_a?(Array)
    assert_equal 32, all.length
    assert all[0].is_a?(Nextbus::Stop)
    assert_equal stop_tag1, all[0].tag
    assert_equal stop_tag2, all[1].tag
  end

  def test_find
    stop_tag      = '23391'
    agency_id     = 'abc'
    route_id      = '321'
    direction_id  = 'out'
    stop_id       = '23391'
    expect_response('route_config.xml', /#{agency_id}.+#{route_id}/, Net::HTTP::Get)
    stop = Nextbus::Stop.find(agency_id, route_id, direction_id, stop_id)
    assert stop.is_a?(Nextbus::Stop)
    assert_equal stop_tag, stop.tag
  end

end
