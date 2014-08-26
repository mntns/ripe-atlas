module Atlas
  class Measurement
   attr_accessor :can_visualise, :creation_time, :description, :dst_addr, :dst_asn, :dst_name, :interval,
    :is_oneoff, :is_public, :msm_id, :probe_sources, :resolve_on_probe, :resolved_ips, :result, :start_time,
    :status, :stop_time, :type
   
   # Just for Eliah Shure: (.)(.)
   def initialize(p)
    p.each do |k,v| 
      send("#{k}=",v)
    end
   end

  end
end
