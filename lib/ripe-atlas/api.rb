require 'json'

module Atlas
  def Atlas.get_probe(id)
    @res = Atlas::Http.get("probe", {:id => id})
    @probe = Atlas::Probe.new(JSON.parse(@res)["objects"].first)
    puts @probe
  end
end
