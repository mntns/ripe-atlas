require 'json'

module ATLAS
  class API

    TYPES = ["measurement", "probe", "participation_request", "participation_request_log"]

    def query(type, params)
      unless TYPES.include?(type)
        raise "error 12312"
      end
      
      case type
      when "measurement"
        #tod
      when "probe"
        #todo
      when "participation_request"
        #todo
      when "participation_request_log"
        #todo
      else
        raise "error 12312"
      end

  end
end
