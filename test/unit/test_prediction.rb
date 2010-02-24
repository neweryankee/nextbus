require File.join(File.dirname(__FILE__), '..', 'helper')

class TestPrediction < Test::Unit::TestCase

  def setup
    @prediction1 = Nextbus::Prediction.new
  end

  def test_time_attr
    assert_attr_accessor @prediction1, :time
  end
  def test_departure_attr
    assert_attr_accessor @prediction1, :departure
  end

  def test_stop_attr
    assert_attr_accessor @prediction1, :stop
  end

  def test_instantiated_with_attrs
    attrs = {:time => Time.now, :departure => false}
    assert_instantiated_with_attrs Nextbus::Prediction, attrs
  end

  def test_epoch_time_setter
    nanosecs = 1266681828070
    time     = Time.at(nanosecs/1000)
    @prediction1.epoch_time = nanosecs
    assert_equal time.to_i, @prediction1.time.to_i
  end

  def test_all
    prediction_time1  = Time.at(1266681828.070)
    prediction_time2  = Time.at(1266681828.075)
    agency_id         = 'abc'
    route_id          = '321'
    stop_id           = '22365'
    expect_response('predictions.xml', /#{agency_id}.+#{route_id}.+#{stop_id}/, Net::HTTP::Get)
    all = Nextbus::Prediction.all(agency_id, route_id, stop_id)
    assert all.is_a?(Array)
    assert_equal 5, all.length
    assert all[0].is_a?(Nextbus::Prediction)
    assert_equal prediction_time1.to_i, all[0].time.to_i
    assert_equal prediction_time2.to_i, all[1].time.to_i
  end

end
