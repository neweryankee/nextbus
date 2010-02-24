require File.join(File.dirname(__FILE__), '..', 'helper')

class TestNextbus < Test::Unit::TestCase

  def test_nextbus_module
    assert Nextbus.is_a?(Module)
  end

end
