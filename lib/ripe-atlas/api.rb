require 'json'
require 'net/http'

module Atlas
  API_URL = "https://atlas.ripe.net/api/v1/probe/"

  def self.get_probe(p)
    @uri = URI(API_URL)
    @params = p

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
