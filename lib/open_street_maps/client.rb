module OpenStreetMaps
  class Client
    include EventMachine::Deferrable
    
    # Create a new OpenStreetMaps client
    #
    # @param [Hash] options Options
    def initialize(options = {})
      @base_uri = 'http://nominatim.openstreetmap.org'
      @default_opts = {:format => 'json', :addressdetails => 1}.merge(options)
      self
    end
    
    # Get an address for a specified point (latitude and longitude)
    # @param [String] lat Latitude
    # @param [String] long Longitude
    # @param [Hash] options Options
    # @param options [String] :format Output format xml or json
    # @param options [String] :json_callback 
    # @param options [String] :accept-language Preferred language order for showing search 
    # results, overrides the browser value. Either uses standard rfc2616 accept-language
    # string or a simple comma separated list of language codes.
    def reverse_geocode(lat, lon, options={})
      request("/reverse", :query => {:lat => lat, :lon => lon}.merge(@default_opts).merge(options))
    end
    
    # Gets a list of locations based on a query
    # @param [String] q Query
    # @param [Hash] options Options
    # @option options [String] :countrycodes For example: ru,en,de
    # @option options [Integer] :limit Limit the number of returned results.
    def query(q, options = {})
      request("/search", :query => {:q => q}.merge(@default_opts).merge(options))
    end

    def query_with_geocoding(query, lat, lon, geocode_options = {}, &callback)
      request("/reverse", :query => {:lat => lat, :lon => lon}.merge(@default_opts).merge(geocode_options)) do |locations|
        options = yield query, locations
        request("/search", :query => options.merge(@default_opts))
      end
    end

    def request(url, opts)
      http = http_request(url, opts)
      http.errback { fail(Exception.new("An error occured in the HTTP request: #{http.errors}")) }
      http.callback do
        begin
          resources = Array.wrap(Yajl::Parser.parse(http.response)).map{|data| OpenStreetMaps::Location.new(data)}
          if block_given?
            yield resources
          else
            succeed(resources)
          end
        rescue Exception => e
          fail(e)
        end
      end
      http
    end

    def http_request(url, opts)
      EventMachine::HttpRequest.new(@base_uri + url).aget(opts)
    end    
  end
end