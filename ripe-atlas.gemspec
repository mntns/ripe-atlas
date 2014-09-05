Gem::Specification.new do |s|
    
  s.name        = 'ripe-atlas'
  s.version     = '0.3.0'
  s.date        = '2014-09-05'
  s.summary     = "A Ruby gem for the RIPE Atlas API."
  s.description = "ripe-atlas is an API wrapper for the RIPE Atlas API. You can get probes and measurements and even stop measurements."
  s.authors     = ["Eddy Shure"]
  s.files       = `git ls-files`.split($/)
  s.licenses    = ['MIT']
  s.homepage    = 'https://github.com/EddyShure/ripe-atlas'
  s.required_ruby_version = '>= 1.9'

  s.add_development_dependency('json', "~> 1.8.1")
  s.add_development_dependency('rest-client', "~> 1.7.2")  
end
