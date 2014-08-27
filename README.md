# ripe-atlas

ripe-atlas is a minimalistic API wrapper for the [RIPE Atlas](https://atlas.ripe.net) API. It is written entirely in Ruby.

At the current state of development, you can:
- Get probes
- Get measurements
- Stop measurements

## Installation
Since ripe-atlas is currently not hosted on RubyGems.org, you have to install it manually. 

Clone the GitHub repository. 
```bash
git clone https://github.com/EddyShure/ripe-atlas.git
```

Navigate into the created directory and build the gem.
```bash
cd ripe-atlas/
gem build ripe-atlas.gemspec
```

Install the gem.
```bash
gem install ripe-atlas-*.gem
```

Congrats, now you can use the ripe-atlas gem!

## Usage

To use the gem, you should require it first:
```ruby
require 'ripe-atlas'
```

### Getting Atlas probes

To get RIPE Atlas probes, you can use 'Atlas.get_probes'.

```ruby
Atlas.get_probes({:id => 333})
```
To get a list of all parameters, visit this site: https://atlas.ripe.net/docs/rest/#probe

### Getting measurements

To get measurement objects, you can use 'Atlas.get_measurements'.
```ruby
Atlas.get_measurements({:status => 3})
```
List of all parameters: https://atlas.ripe.net/docs/rest/#measurement

### Stopping measurements
```ruby
Atlas.stop_measurement(id, "api-key")
```

##TODO
* Add probe-participation-request
* Clean up code
* Add MeasurementRequest

## Donate

If you would like to support me, you can buy me a bottle of Club Mate via GitTip:

<a href="https://www.gittip.com/EddyShure/">
  <img alt="Support via Gittip" src="https://rawgithub.com/twolfson/gittip-badge/0.2.0/dist/gittip.png"/>
</a>
