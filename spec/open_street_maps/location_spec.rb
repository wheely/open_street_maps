# encoding: utf-8
require 'spec_helper'

describe OpenStreetMaps::Location do
  it "parses special buldings" do
    hash = {"licence"=>"Data Copyright OpenStreetMap Contributors, Some Rights Reserved. CC-BY-SA 2.0.",
            "place_id"=>"137922", "osm_type"=>"node", "osm_id"=>"26608563",
            "boundingbox"=>["52.8185980225", "52.8386018372", "-1.33945156097", "-1.31945144176"],
            "lat"=>"52.8286008", "lon"=>"-1.3294515","class"=>"place", "type"=>"airport",
            "display_name"=>"East Midlands Airport, Lockington-Hemington, Castle Donington, Leicestershire, East Midlands, England, United Kingdom",
            "icon"=>"http://open.mapquestapi.com/nominatim/v1/images/mapicons/transport_airport2.p.20.png",
            "address"=>{"airport"=>"East Midlands Airport", "suburb"=>"Lockington-Hemington",
                         "village"=>"Castle Donington", "county"=>"Leicestershire", "state_district"=>"East Midlands",
                         "state"=>"England", "country"=>"United Kingdom", "country_code"=>"gb"}}
    l = OpenStreetMaps::Location.new(hash)
    l.name.should == hash["address"]["airport"]
  end
end