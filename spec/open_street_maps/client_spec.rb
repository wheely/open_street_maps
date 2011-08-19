# encoding: utf-8
require 'spec_helper'

describe OpenStreetMaps::Client do
  before(:each) do
    @client = OpenStreetMaps.new
  end

  it "performs a reverse_geocode request" do
    result = nil
    EM.run do
      @client.callback do |locations|
        result = locations
        EM.stop
      end
      @client.reverse_geocode('49.468124', '8.48144')
    end
    result.size.should == 1
  end

  it "performs a query request" do
    result = nil
    EM.run do
      @client.callback do |locations|
        result = locations
        EM.stop
      end
      @client.query('Bahnhofstrasse, Zurich')
    end
    result.size.should > 1
  end  
end
