module Atlas
  module MCR
    class Probes
      attr_accessor :requested, :type, :value

      TYPES = [:area, :country, :prefix, :asn, :probes]
      AREAS = ["WW", "West", "North-Central", "South-Central", "North-East", "South-East"]
      
      def validate_value(type, value)
        case type
        when :area
          raise Atlas::MCR::Error, "Invalid area." unless AREAS.include?(value)
        when :country
          raise Atlas::MCR::Error, "Invalid country code." unless 
        when :prefix
          raise Atlas::MCR::Error, "Invalid prefix." unless value.is_a? Fixnum and value.length == 2
        when :asn
          raise Atlas::MCR::Error, "Invalid ASN." unless
        when :probes
      def initialize(requested, type, value)
        if not TYPES.include? type
          raise Atlas::MCR::Error, "Wrong type!"
        end

      end
  end
end
