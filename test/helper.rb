require 'bundler'
require 'rubygems'
require 'test/unit'
require 'minitest/unit'
require 'minitest/spec'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))


require 'mini_token'
Bundler.setup


class Test::Unit::TestCase
end