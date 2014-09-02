module Atlas
  class Probe
    
    attr_accessor :address_v4, :address_v6, :asn_v4, :asn_v6, :country_code, :id, :is_anchor, 
      :is_public, :latitude, :longitude, :prefix_v4, :prefix_v6, :status, :status_name, :status_since,
      :tags

    def initialize(p)
      p.each do |k,v| 
        send("#{k}=",v)
      end
    end

  end  
end
