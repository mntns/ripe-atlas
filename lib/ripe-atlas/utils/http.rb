module Atlas
  module Http
    
    API_URL = "https://atlas.ripe.net/api/v1/"

    def self.get(type, params)
      @uri = URI(API_URL + type)
      @uri.query = URI.encode_www_form(params)
      @res = Net::HTTP.get_response(@uri)
      return @res.body if @res.is_a?(Net::HTTPSuccess)
    end

    def self.post(type, params)
      @uri = URI(API_URL + type)
      @res = Net::HTTP.post_form(@uri, params)
      return @res.body if @res.is_a?(Net::HTTPSuccess)
    end

    def self.delete(type,params)
      # TODO
    end

  end
end
