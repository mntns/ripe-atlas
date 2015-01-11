module Atlas
  class Measurement
   attr_accessor :af, :all_scheduling_requests_fulfilled, :can_visualise, :creation_time, 
     :description, :dst_addr, :dst_asn, :dst_name, :interval, :is_oneoff, :is_public, :msm_id, 
     :participant_count, :resolve_on_probe, :resolved_ips, :result, :start_time, :status, :stop_time, :type
   
   def initialize(data)
    p.each do |k,v| 
      send("#{k}=",v)
    end
   end

  end
end
