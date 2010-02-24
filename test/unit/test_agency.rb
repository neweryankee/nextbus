require File.join(File.dirname(__FILE__), '..', 'helper')

class TestAgency < Test::Unit::TestCase

  def setup
    super
    @agency1 = Nextbus::Agency.new
  end

  def test_tag_attr
    assert_attr_accessor @agency1, :tag
  end
  def test_title_attr
    assert_attr_accessor @agency1, :title
  end
  def test_short_title_attr
    assert_attr_accessor @agency1, :short_title
  end
  def test_region_title_attr
    assert_attr_accessor @agency1, :region_title
  end

  def test_routes_attr
    assert_attr_accessor @agency1, :routes, []
  end
  def test_vehicles_attr
    assert_attr_accessor @agency1, :vehicles, []
  end

  def test_instantiated_with_attrs
    attrs = {:tag => 'my tag', :title => 'my title', :short_title => 'my short title', :region_title => 'my region title'}
    assert_instantiated_with_attrs Nextbus::Agency, attrs
  end

  def test_all
    agency_title1 = 'MBTA'
    agency_title2 = 'San Francisco Muni'
    expect_response('agency_list.xml', nil, Net::HTTP::Get)
    all = Nextbus::Agency.all
    assert all.is_a?(Array)
    assert_equal 2, all.length
    assert all[0].is_a?(Nextbus::Agency)
    assert_equal agency_title1, all[0].title
    assert_equal agency_title2, all[1].title
  end

  def test_find
    agency_title = 'MBTA'
    expect_response('agency_list.xml', nil, Net::HTTP::Get)
    agency_id = 'mbta'
    agency = Nextbus::Agency.find(agency_id)
    assert agency.is_a?(Nextbus::Agency)
    assert_equal agency_title, agency.title
  end

end
