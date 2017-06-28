# RskSnitch

Check if your rootstock node is running by looking it up by node id in
http://stats.rsk.co

Notice node ids are not always the same that show up in the stats page.

This is is the type of node id you should use: rskNode02SaEast1

This is what shows up on the stats page: rsk-node-02.sa-east-1

## Installation

    $ gem install rsk_snitch

Or add this line to your application's Gemfile:

```ruby
gem 'rsk_snitch'
```

And then execute:

    $ bundle


## Usage

In Shell scripts:

```bash
  $ rsk_snitch rskNode02SaEast1
  Looking for a node with id rskNode02SaEast1, this may take a while.
  Found it
  $ echo $?
  0
```

As a ruby lib
```ruby
  > RskSnitch::Nodes.up?('rskNode02SaEast1')
  true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bitex-la/rsk-snitch.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

