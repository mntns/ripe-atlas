# ripe-atlas

ripe-atlas is a minimalistic API wrapper for the [RIPE Atlas](https://atlas.ripe.net) API. It is written entirely in Ruby.

At the current state of development, you can:
- Get probes
- Get measurements
- Stop measurements

---

## Installation
```ruby
gem install ripe-atlas
```
Congratulations, now you can use the ripe-atlas gem!

---

## Usage

To use the gem, you should require it first:
```ruby
require 'ripe-atlas'
```

Then you should create a client. You can pass an API key:
```ruby
client = Atlas::Client.new "1234-1234-1234-1234"
```
Now, you should be able to do some magic with your freshly initialized client:

### Getting Atlas probes

To get RIPE Atlas probes, you can use #get_probes.

```ruby
client.get_probes({:id => 333})
```
To get a list of all parameters, visit this site: https://atlas.ripe.net/docs/rest/#probe

### Getting measurements

To get measurement objects, you can use #get_measurements.
```ruby
client.get_measurements({:status => 3})
```
List of all parameters: https://atlas.ripe.net/docs/rest/#measurement

### Stopping measurements
```ruby
client.stop_measurement(id)
```

## Donate

If you would like to support me or buy me a bottle of Club Mate, you can do it here:

<a href="https://www.gittip.com/EddyShure/">
  <img alt="Support via Gittip" src="https://rawgithub.com/twolfson/gittip-badge/0.2.0/dist/gittip.png"/>
</a>

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=EddyShure&url=https://github.com/EddyShure/ripe-atlas&title=ripe-atlas&language=Ruby&tags=github&category=software)
