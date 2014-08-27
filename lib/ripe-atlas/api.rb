require 'json'
require 'rest_client'

module Atlas
  API = "https://atlas.ripe.net/api/v1/"
  
  def self.get_object(type, p)
    @url = API + "#{type}/"
    @res = RestClient.get(@url, {:accept => :json, :params => p})

    if @res.code == 200
      @json = JSON.parse @res.body
    end

    @objects = Array.new
    @json["objects"].each do |n|
      case type
      when "probe"
        @objects << Atlas::Probe.new(n)
      when "measurement" 
        @objects << Atlas::Measurement.new(n)
      else
        raise "F*** you all!"
      end
    end

    return @objects
  end

  def self.get_probes(p)
    @probes = get_object("probe", p)
    return @probes
  end

  def self.get_measurements(p)
    @measurements = get_object("measurement", p)
    return @measurements
  end

  def self.stop_measurement(id, key)
    @url = API + "measurement/" + "#{id}/" + "?key=" + key.to_str
    @res = RestClient.delete(@url)
    if @res.code == 200
      return true
    else
      return false
    end
  end
end
