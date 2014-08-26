require 'json'
require 'net/http'

module Atlas
  API_URL = "https://atlas.ripe.net/api/v1/"

  # 0: Probe
  # 1: Measurement

  def self.get_object(type, p)
    if type == 0
      @type = "probe/"
    else
      @type = "measurement/"
    end

    @uri = URI(API_URL + @type)

    @uri.query = URI.encode_www_form(p)
    @res = Net::HTTP.get_response(@uri)
    if @res.is_a? Net::HTTPSuccess
      @json = JSON.parse @res.body
    end
    
    p @json

    @objects = Array.new
    @json["objects"].each do |n|
      if type == 0
        @objects << Atlas::Probe.new(n)
      elsif type == 1
        @objects << Atlas::Measurement.new(n)
      else
        raise "F*** you all!"
      end
    end

    return @objects
  end

  def self.get_probes(p)
    @probes = get_object(0, p)
    return @probes
  end

  def self.get_measurements(p)
    @measurements = get_object(1, p)
    return @measurements
  end
end
