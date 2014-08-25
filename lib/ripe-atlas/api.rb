require 'json'
require 'net/http'

module Atlas
  API_URL = "https://atlas.ripe.net/api/v1/probe/"
  FIELDS = [:address_v4, :address_v6, :asn_v4, :asn_v6, :country_code, :id, :is_anchor,
            :is_public, :latitude, :longitude, :prefix_v4, :prefix_v6, 
            :status, :status_name, :status_since]

  def self.get_probe(p)
    @uri = URI(API_URL)
    @params = {}
    
    p.each do |k,v|
      if FIELDS.include? k
        @params[k] = v
      end
    end

    @uri.query = URI.encode_www_form(@params)
    @res = Net::HTTP.get_response(@uri)
    if @res.is_a? Net::HTTPSuccess
      @json = JSON.parse @res.body
    end

    @probes = Array.new
    @json["objects"].each do |n|
      @probes << Atlas::Probe.new(n)
    end

    return @probes 
  end

end
