require 'json'

module ATLAS
  
  class API
    def get_probe(params)
     
      

      ATLAS::HTTP.get()

      @object = JSON.parse(@res)["objects"].first
      @probe = Probe.new
      p @
      
    
    def get_measurement
      return "Not yet supported."
    end

    def get_participation_request
      return "Not yet supported."
    end

    end
  end

end
