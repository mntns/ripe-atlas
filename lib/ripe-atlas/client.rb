module Atlas
  class Client
    attr_accessor :key
    
    API_URL = "https://atlas.ripe.net/api/v1/"

    def initialize(key = nil)
      @key = key
    end

    def get_thing(type, p)
      url = API_URL + "#{type.to_s}/"
      res = RestClient.get(url, {:accept => :json, :params => p})

      case res.code
      when 200
        json = JSON.parse res.body
      when 401
        raise Atlas::AuthError
      end

      case type
      when :probe
        json["objects"].map do |n|
          Atlas::Probe.new(n)
        end
      when :measurement
        json["objects"].map do |n|
          Atlas::Measurement.new(n)
        end
      else
        puts "mepe"
      end
    end

    def get_probes(p)
      get_thing(:probe, p)
    end

    def get_measurements(p)
      get_thing(:measurement, p)
    end

    def get_measurement(id)
      url = API_URL + "measurement/#{id}/"
      res = RestClient.get(url, {:accept => :json})

      if res.code == 200
        json = JSON.parse res.body
      end

      Atlas::Measurement.new(json["object"])
    end

    def stop_measurement(id)
      url = API_URL + "measurement/#{id}/?key=#{@key}"
      res = RestClient.delete(url)
      case res.code
      when 204
        true
      when 401
        raise Atlas::AuthError
      else
        false
      end
    end
  end
end
