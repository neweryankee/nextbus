require File.join(File.dirname(__FILE__), '..', 'helper')

class TwoStandardAttrReaders < Test::Unit::TestCase

  include AttrWithDefault

  attr_reader :foo, :baz

  def test_should_not_define_first_instance_variable
    assert_equal false, instance_variable_defined?(:@foo)
  end

  def test_should_return_first_instance_variable_when_sent_first_attr_reader
    @foo = 'bar'
    assert_equal 'bar', foo
  end

  def test_should_not_define_second_instance_variable
    assert_equal false, instance_variable_defined?(:@baz)
  end

  def test_should_return_second_instance_variable_when_sent_second_attr_reader
    @baz = 'bat'
    assert_equal 'bat', baz
  end

end

class TwoStandardAttrAccessors < Test::Unit::TestCase

  include AttrWithDefault

  attr_accessor :foo, :baz

  def test_should_not_define_first_instance_variable
    assert_equal false, instance_variable_defined?(:@foo)
  end

  def test_should_return_first_instance_variable_when_sent_first_attr_reader
    @foo = 'bar'
    assert_equal 'bar', foo
  end

  def test_should_set_first_instance_variable_when_sent_first_attr_writer
    self.foo = 'bar'
    assert_equal 'bar', @foo
  end

  def test_should_not_define_second_instance_variable
    assert_equal false, instance_variable_defined?(:@baz)
  end

  def test_should_return_second_instance_variable_when_sent_second_attr_reader
    @baz = 'bat'
    assert_equal 'bat', baz
  end

  def test_should_set_second_instance_variable_when_sent_second_attr_writer
    self.baz = 'bat'
    assert_equal 'bat', @baz
  end

end

class TwoStandardAttrReadersAndADefault < Test::Unit::TestCase

  include AttrWithDefault

  attr_reader :foo, :baz, :blit => 'blat'

  def test_should_not_define_first_instance_variable
    assert_equal false, instance_variable_defined?(:@foo)
  end

  def test_should_return_first_instance_variable_when_sent_first_attr_reader
    @foo = 'bar'
    assert_equal 'bar', foo
  end

  def test_should_not_define_second_instance_variable
    assert_equal false, instance_variable_defined?(:@baz)
  end

  def test_should_return_second_instance_variable_when_sent_second_attr_reader
    @baz = 'bat'
    assert_equal 'bat', baz
  end

  def test_should_not_define_third_instance_variable
    assert_equal false, instance_variable_defined?(:@blit)
  end

  def test_should_set_third_instance_variable_when_sent_third_attr_reader
    blit
    assert_equal 'blat', @blit
  end

  def test_should_not_set_third_instance_variable_if_already_set_when_sent_third_attr_reader
    @blit = 'splat'
    assert_equal 'splat', blit
  end

end

class TwoStandardAttrAccessorsAndADefault < Test::Unit::TestCase

  include AttrWithDefault

  attr_accessor :foo, :baz, :blit => 'blat'

  def test_should_not_define_first_instance_variable
    assert_equal false, instance_variable_defined?(:@foo)
  end

  def test_should_return_first_instance_variable_when_sent_first_attr_reader
    @foo = 'bar'
    assert_equal 'bar', foo
  end

  def test_should_set_first_instance_variable_when_sent_first_attr_writer
    self.foo = 'bar'
    assert_equal 'bar', @foo
  end

  def test_should_not_define_second_instance_variable
    assert_equal false, instance_variable_defined?(:@baz)
  end

  def test_should_return_second_instance_variable_when_sent_second_attr_reader
    @baz = 'bat'
    assert_equal 'bat', baz
  end

  def test_should_set_second_instance_variable_when_sent_second_attr_writer
    self.baz = 'bat'
    assert_equal 'bat', @baz
  end

  def test_should_not_define_third_instance_variable
    assert_equal false, instance_variable_defined?(:@blit)
  end

  def test_should_set_third_instance_variable_when_sent_third_attr_reader
    blit
    assert_equal 'blat', @blit
  end

  def test_should_not_set_third_instance_variable_if_already_set_before_sent_third_attr_reader
    @blit = 'splat'
    assert_equal 'splat', blit
  end

  def test_should_set_third_instance_variable_when_sent_third_attr_writer
    self.blit = 'splat'
    assert_equal 'splat', @blit
  end

end
