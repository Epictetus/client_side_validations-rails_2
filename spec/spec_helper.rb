require 'rubygems'
require 'bundler'
Bundler.setup

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruby-debug'
require 'rspec'
require 'rspec/autorun'

require 'client_side_validations/rails_2'
