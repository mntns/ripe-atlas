require 'json'
require 'net/http'

module Atlas
  API_URL = "https://atlas.ripe.net/api/v1/probe/"

  def get_probe_by_id(id)
    @uri = URI(API_URL + "?id=" + id)
    @res = Net::HTTP.get @uri
    @json = JSON.parse @res
    
    @probe = Atlas::Probe.new(@json["objects"].first)
    return @probe  
  end

end
