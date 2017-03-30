# RskSnitch

Check if your rootstock node is running by looking it up in stats.rsk.co

Can be used as a ruby library, but also provides a command line utility for your shell scripts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rsk_snitch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsk_snitch

## Usage

In bash:
```bash
  $ rsk_snitch rsk-node-04.eu-west-1
  Looking for a node with id rsk-node-04.eu-west-1, this may take a while.
  Found it
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bitex-la/rsk-snitch.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

