Gem::Specification.new do |s|
    
  s.name        = 'ripe-atlas'
  s.version     = '0.0.1'
  s.date        = '2014-08-26'
  s.summary     = "A Ruby gem for the RIPE Atlas API."
  s.description = "A Ruby gem for doing things with the RIPE Atlas API."
  s.authors     = ["Eddy Shure"]
  s.files       = `git ls-files`.split($/)
  s.license     = 'GPL-3'

  s.add_development_dependency('json', "~> 1.8.1")
  
end
