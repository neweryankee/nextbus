require 'httparty'
require 'hashie'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'instantiate_with_attrs'
require 'attr_with_default'

dir = File.join(File.dirname(__FILE__), 'nextbus')
$LOAD_PATH.unshift(dir)
Dir[File.join(dir, "*.rb")].each {|file| require File.basename(file) }
