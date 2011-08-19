module OpenStreetMaps
  class Location
    attr_reader :place_id, :licence, :osm_type, :osm_id, :boundingbox,
                :lat, :lon, :display_name, :class, :type, :icon, :address
    
    def initialize(options={})
      @place_id = options['place_id']
      @licence  = options['licence']
      @osm_type = options['osm_type']
      @osm_id   = options['osm_id']
      @boundingbox = options['boundingbox']
      @lat      = options['lat']
      @lon      = options['lon']
      @display_name = options['display_name']
      @class    = options['class']
      @type     = options['type']
      @icon     = options['icon']
      @address  = options['address']
      # Sample Address:
      #  {"house_number":"14",
      #           "road":"Speyerer Straße",
      #         "suburb":"Almenhof",
      #           "city":"Mannheim",
      #         "county":"Mannheim",
      # "state_district":"Regierungsbezirk Karlsruhe",
      #          "state":"Baden-Württemberg",
      #       "postcode":"68163",
      #        "country":"Germany",
      #   "country_code":"de"}
    end    
  end
end
