# ThumborHelpers - WIP

A collection of helpers/overrides to simplify live for use thumbor with rails and alchemy.
The concept is to install the gem in a project and without change of code have access 
to features of thumbor.

Thumbor documentation: https://thumbor.readthedocs.io/en/latest/index.html

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thumbor_helpers'
```

And then execute:

    $ bundle install

And then install the initializer:

    $ bin/rails generate thumbor_helpers:initializer

Now go in config/initializers and configure the thumbors with the server creadentials.

## Usage

TODO: Write usage instructions here

## Development

Start a thumbor server with the command:

```shell
docker run --network host -e THUMBOR_PORT=8888 -e SECURITY_KEY='1234567890123456' -e AUTO_WEBP='True' -e ALLOW_UNSAFE_URL='False'  minimalcompact/thumbor thumbor
```

## Version Release

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, 
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/thumbor_helpers.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
