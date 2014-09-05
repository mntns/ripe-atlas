module Atlas
  class Client
    attr_accessor :key
    
    API = "https://atlas.ripe.net/api/v1/"

    def initialize(key = nil)
      if key.is_a? String and key != nil
        send("key=", key)
      end
    end

    def get_object(type, p)
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

    def get_probes(p)
      @probes = get_object("probe", p)
      return @probes
    end

    def get_measurements(p)
      @measurements = get_object("measurement", p)
      return @measurements
    end

    def get_measurement(id)
      @url = API + "measurement/#{id}/"
      @res = RestClient.get(@url, {:accept => :json})

      if @res.code == 200
        @json = JSON.parse @res.body
      end

      @measurement = Atlas::Measurement.new(@json["object"])
      return @measurement
    end

    def stop_measurement(id)
      if self.key == nil
        raise "Specify an API key!"
      end
      @url = API + "measurement/" + "#{id}/" + "?key=" + self.key
      @res = RestClient.delete(@url)
      p @res
      puts @res.code
      if @res.code == 204
        return true
      else
        return false
      end
    end
  end
end
