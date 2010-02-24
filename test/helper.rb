begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'test/unit'
require 'mocha'
require 'erb'
require 'ruby-debug'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'nextbus'

class Test::Unit::TestCase

  def setup
    response = Net::HTTPOK.new("1.1", 200, "Content for you")
    response.stubs(:body).returns("")
    http_request = HTTParty::Request.new(Net::HTTP::Get, 'http://localhost', :format => :xml)
    http_request.stubs(:perform_actual_request).returns(response)
    HTTParty::Request.stubs(:new).returns(http_request)
  end

  def file_fixture(filename)
    open(File.join(File.dirname(__FILE__), 'fixtures', "#{filename.to_s}")).read
  end

  def expect_response(filename, path=nil, method=nil)
    format = filename.split('.').last.intern
    data = file_fixture(filename)

    response = Net::HTTPOK.new("1.1", 200, "Content for you")
    response.stubs(:body).returns(data)

    http_request = HTTParty::Request.new(Net::HTTP::Get, 'http://localhost', :format => format)
    http_request.stubs(:perform_actual_request).returns(response)

    HTTParty::Request.expects(:new).with{|*args| (path.nil? || args[1] =~ path) && (method.nil? || args.first == method) }.returns(http_request)
  end

  def assert_instantiated_with_attrs(klass, attrs={})
    object = klass.new(attrs)
    attrs.each {|name, value| assert_equal value, object.send(name) }
  end

  def assert_attr_accessor(object, attr_name, expected_value=nil, new_value='some value')
    assert_attr_reader(object, attr_name, expected_value)
    assert_attr_writer(object, attr_name, expected_value)
    setter = setter_from_attr_name(attr_name)
    assert_not_equal new_value, object.send(attr_name), "With #{object}"
    object.send(setter, new_value)
    assert_equal new_value, object.send(attr_name), "With #{object}"
    object.send(setter, expected_value)
  end

  def assert_attr_reader(object, attr_name, expected_value=nil)
    assert object.respond_to?(attr_name), "Expected #{object} to respond to #{attr_name.to_s}"
    assert_equal expected_value, object.send(attr_name), "With #{object}"
  end

  def assert_attr_writer(object, attr_name, new_value=nil)
    setter = setter_from_attr_name(attr_name)
    assert object.respond_to?(setter), "Expected #{object} to respond to #{setter.to_s}"
    assert_equal new_value, object.send(setter, new_value), "With #{object}"
  end

  def setter_from_attr_name(attr_name)
    "#{attr_name.to_s}=".to_sym
  end

end
