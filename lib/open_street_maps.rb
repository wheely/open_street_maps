require 'em-http-request'
require 'em-synchrony'
require 'em-synchrony/em-http'
require 'yajl/json_gem'

module OpenStreetMaps
  def self.new(options = {})
    OpenStreetMaps::Client.new(options)
  end
end

require 'open_street_maps/client'
require 'open_street_maps/location'
require 'open_street_maps/ext/array'