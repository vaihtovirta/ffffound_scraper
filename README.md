# FfffoundParser

Simple parser for grabing images from ffffound.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ffffound_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffffound_parser

## Usage

```ruby
FfffoundParser.find(PAGE_NUMBER)
#=> #<FfffoundParser::Parser:0x007f7f06801bf0
@image_list=
      [#<struct Struct::Image link="25.media.tumblr.com/tumblr_le9kfgSmA81qb5tu1o1_500.gif", posted_at="2015-06-26 02:15:25">,
       #<struct Struct::Image link="24.media.tumblr.com/ddaf5101cb946501dbbcfb1387248fa7/tumblr_n35rnjzzXJ1twnn02o1_500.jpg", posted_at="2015-06-25 17:49:12">,
       <...>
     @page_number=1>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ffffound_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
