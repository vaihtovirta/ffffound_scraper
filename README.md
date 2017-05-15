# FfffoundScaper

Simple parser for grabing images from ffffound.com

Compatible with Ruby 2.3.x

# NOTE
  Gem is useless now since http://ffffound.com has shut down on May 8th.
  ![](https://api.monosnap.com/rpc/file/download?id=wwHSmqsMPRkrKSA6hIsw9Lx1WtvQPv)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ffffound_scraper', github: 'https://github.com/vaihtovirta/ffffound_scraper'
```

And then execute:

    $ bundle install

## Usage

```ruby
FfffoundScaper.call(1)
=> [#<FfffoundScaper::Image:0x007fe0b2aab960 @link="24.media.tumblr.com/tumblr_lmelk2KNz11qz6f9yo1_500.jpg", @posted_at="2016-08-01 21:39:23">,
 #<FfffoundScaper::Image:0x007fe0b2aa9f20 @link="omnireboot.com/wp-content/uploads/2014/11/omni-reboot-logo-retina1.png", @posted_at="2016-07-31 20:31:36">,
 #<FfffoundScaper::Image:0x007fe0b2aa8418 @link="30.media.tumblr.com/tumblr_llbg54dNfn1qaj9jbo1_500.jpg", @posted_at="2016-07-29 20:30:03">,
 #<FfffoundScaper::Image:0x007fe0b201f6e0 @link="28.media.tumblr.com/tumblr_lvq9nuRsHd1qzsnzco1_500.jpg", @posted_at="2016-07-26 02:29:07">,
 #<FfffoundScaper::Image:0x007fe0b201eba0 @link="www.sort-hvid.dk/wp-contents/uploads/2015/10/Grafik_Uropa-800x239.jpg", @posted_at="2016-07-26 00:00:03">,
 #<FfffoundScaper::Image:0x007fe0b201e060 @link="4.bp.blogspot.com/-bvvWyalRBtQ/TZiDEal1aJI/AAAAAAAAA4k/cvvqfJUl0ZM/s640/Silas+make.jpg", @posted_at="2016-07-25 08:53:07">, ...
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ffffound_scraper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
