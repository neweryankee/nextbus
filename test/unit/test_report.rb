require File.join(File.dirname(__FILE__), '..', 'helper')

class TestReport < Test::Unit::TestCase

  def setup
    @report1 = Nextbus::Report.new
  end

  def test_lat_attr
    assert_attr_accessor @report1, :lat
  end
  def test_lon_attr
    assert_attr_accessor @report1, :lon
  end
  def test_heading_attr
    assert_attr_accessor @report1, :heading
  end
  def test_time_attr
    assert_attr_accessor @report1, :time
  end

  def test_vehicle_attr
    assert_attr_accessor @report1, :vehicle
  end
  def test_direction_attr
    assert_attr_accessor @report1, :direction
  end

  def test_instantiated_with_attrs
    attrs = {:lat => 'my lat', :lon => 'my lon', :heading => 'my heading', :time => Time.now}
    assert_instantiated_with_attrs Nextbus::Report, attrs
  end

end
