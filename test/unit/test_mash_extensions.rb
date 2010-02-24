require File.join(File.dirname(__FILE__), '..', 'helper')

class TestMashExtensions < Test::Unit::TestCase

  def setup
    super
    @value = 'my value'
  end

  def test_convert_hash_with_camel_case_key
    hash = { 'CamelCaseKey' => @value }
    mash = Hashie::Mash.new(hash)
    assert_equal @value, mash['camel_case_key']
    assert_equal @value, mash.camel_case_key
  end

  def test_convert_hash_with_uppercase_key
    hash = { 'UPPERCASEKEY' => @value }
    mash = Hashie::Mash.new(hash)
    assert_equal @value, mash['uppercasekey']
    assert_equal @value, mash.uppercasekey
  end

  def test_convert_hash_with_camel_case_with_space_in_key
    hash = { 'CamelCase Key' => @value }
    mash = Hashie::Mash.new(hash)
    assert_equal @value, mash['camel_case_key']
    assert_equal @value, mash.camel_case_key
  end

  def test_convert_hash_with_underscored_key
    hash = { 'already_underscored_key' => @value }
    mash = Hashie::Mash.new(hash)
    assert_equal @value, mash['already_underscored_key']
    assert_equal @value, mash.already_underscored_key
  end

  def test_convert_nested_hash_with_camel_case_key
    hash = { 'CamelCaseKey1' => { 'CamelCaseKey2' => @value } }
    mash = Hashie::Mash.new(hash)
    assert_equal @value, mash['camel_case_key1']['camel_case_key2']
    assert_equal @value, mash.camel_case_key1.camel_case_key2
  end

end
