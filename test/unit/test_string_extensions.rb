require File.join(File.dirname(__FILE__), '..', 'helper')

class TestStringExtensions < Test::Unit::TestCase

  def setup
    super
  end

  def test_camel_case
    str = 'CamelCaseString'
    assert_equal 'camel_case_string', String.underscore(str)
    assert_equal 'camel_case_string', str.underscore
  end

  def test_uppercase
    str = 'UPPERCASE'
    assert_equal 'uppercase', String.underscore(str)
    assert_equal 'uppercase', str.underscore
  end

  def test_camel_case_with_space
    str = 'CamelCase String'
    assert_equal 'camel_case_string', String.underscore(str)
    assert_equal 'camel_case_string', str.underscore
  end

  def test_underscored
    str = 'already_underscored'
    assert_equal 'already_underscored', String.underscore(str)
    assert_equal 'already_underscored', str.underscore
  end

end
