# encoding: utf-8
require 'spec_helper'

describe OpenStreetMaps::Client do
  before(:each) do
    @client = OpenStreetMaps.new
  end

  describe "#reverse_geocode" do
    it "performs a reverse_geocode request" do
      result = nil
      EM.synchrony do
        @client.callback do |locations|
          result = locations
          EM.stop
        end
        @client.reverse_geocode('49.468124', '8.48144')
      end
      result.size.should == 1
    end
  end

  describe "#query" do
    it "performs a query request" do
      result = nil
      EM.synchrony do
        @client.callback do |locations|
          result = locations
          EM.stop
        end
        @client.query('airport,moscow')
      end
      result.size.should > 0
    end
  end

  describe "#query_with_geocoding" do
    it "combines detecting current address and querying" do
      result = nil
      EM.synchrony do
        @client.callback do |locations|
          result = locations
          EM.stop
        end
        @client.query_with_geocoding("airport", '55.755786', '37.617633') do |query, locations|
          location = locations.first
          query = "#{query},#{location.address['state']}"
          {:q => query, :countrycodes => location.address['country_code']}
        end
      end
      result.size.should > 0
    end
  end
end
