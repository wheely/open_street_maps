# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "openstreetmaps/version"

Gem::Specification.new do |s|
  s.name        = "openstreetmaps"
  s.version     = BingMaps::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ivan Samsonov"]
  s.email       = ["ivan@wheely.com"]
  s.homepage    = "http://wheely.com"
  s.summary     = %q{Open Street Maps API wrapper}
  s.description = %q{Open Street Maps API wrapper}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "em-http-request", '>= 1.0.0.beta.4'
  s.add_dependency "em-synchrony", '>= 0.3.0.beta.1'
  s.add_dependency "yajl-ruby"
end
