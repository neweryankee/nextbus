require File.join(File.dirname(__FILE__), '..', 'helper')

class TestRoute < Test::Unit::TestCase

  def setup
    @route1 = Nextbus::Route.new
  end

  def test_tag_attr
    assert_attr_accessor @route1, :tag
  end
  def test_title_attr
    assert_attr_accessor @route1, :title
  end

  def test_agency_attr
    assert_attr_accessor @route1, :agency
  end
  def test_directions_attr
    assert_attr_accessor @route1, :directions, []
  end

  def test_instantiated_with_attrs
    attrs = {:tag => 'my tag', :title => 'my title'}
    assert_instantiated_with_attrs Nextbus::Route, attrs
  end

  def test_all
    route_title1 = '39'
    route_title2 = '111'
    agency_id    = 'abc'
    expect_response('route_list.xml', /#{agency_id}/, Net::HTTP::Get)
    all = Nextbus::Route.all(agency_id)
    assert all.is_a?(Array)
    assert_equal 2, all.length
    assert all[0].is_a?(Nextbus::Route)
    assert_equal route_title1, all[0].title
    assert_equal route_title2, all[1].title
  end

  def test_find
    route_title = '39'
    agency_id   = 'abc'
    route_id    = '123'
    expect_response('route_config.xml', /#{agency_id}.+#{route_id}/, Net::HTTP::Get)
    route = Nextbus::Route.find(agency_id, route_id)
    assert route.is_a?(Nextbus::Route)
    assert_equal route_title, route.title
  end

end
