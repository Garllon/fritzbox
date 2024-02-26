
# Fritzbox

[![Gem
Version](https://badge.fury.io/rb/fritzbox.svg)](https://badge.fury.io/rb/fritzbox)
[![Rspec and Rubocop](https://github.com/garllon/fritzbox/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/garllon/fritzbox/actions/workflows/ci.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/3a9960235e346f844f12/maintainability)](https://codeclimate.com/github/Garllon/fritzbox/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3a9960235e346f844f12/test_coverage)](https://codeclimate.com/github/Garllon/fritzbox/test_coverage)

A client for the Fritzbox API, from version 5.50 and above.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fritzbox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fritzbox

## Usage

You need to configure the `fritzbox` first:
``` ruby
Fritzbox.configure do |config|
  config.password = 'FRITZBOX_PASSWORD'
end
```

## Development

After checking out the repo, run
```shell
bundle install
```

Then, run
```shell
bundle exec rspec spec
```
to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

By default it expects a `.env` file looks like, if you want to test it against your fritzbox instance:
```shell
PASSWORD=<FRITZBOX_PASSWORD>
```
However, you can also create different environment files and start the console with it:
```shell
ENV_FILE=.env.test ./bin/console
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/garllon/fritzbox](https://github.com/garllon/fritzbox). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HubspotClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/garllon/fritzbox/blob/main/CODE_OF_CONDUCT.md).
