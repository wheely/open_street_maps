require 'rubygems'
require 'bundler/setup'

require 'rack/test'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'lib', 'open_street_maps')

RSpec.configure do |c|
  c.mock_with :rr
end