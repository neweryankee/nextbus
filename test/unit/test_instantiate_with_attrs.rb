require File.join(File.dirname(__FILE__), '..', 'helper')

module Testing__
  class Foo
    attr_accessor :name
    include InstantiateWithAttrs
  end
end

class TestInstantiateWithAttrs < Test::Unit::TestCase

  def test_instantiated_without_any_attrs
    object = Testing__::Foo.new
    assert_nil object.name
  end

  def test_instantiated_with_attrs
    name = 'my name'
    attrs = {:name => name}
    object = Testing__::Foo.new attrs
    assert_equal name, object.name
  end

  def test_instantiated_with_invalid_attr
    attrs = {:wrong => 'boom'}
    assert_nothing_raised do
      Testing__::Foo.new attrs
    end
  end

end
