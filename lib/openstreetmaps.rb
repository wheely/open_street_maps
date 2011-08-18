require 'em-http-request'
require 'em-synchrony/em-http'
require 'yajl/json_gem'

module OpenStreetMaps
  def self.new(options = {})
    OpenStreetMaps::Client.new(options)
  end
end

require 'openstreetmaps/client'
require 'openstreetmaps/location'
require 'openstreetmaps/ext/array'