# Breizhipsum

[![Gem Version](https://badge.fury.io/rb/breizhipsum.svg)](http://badge.fury.io/rb/breizhipsum)

Génération de faux texte avec des expressions bretonnes.

## TODO

- Write specs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'breizhipsum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install breizhipsum

## Usage

### From ruby

Require gem with `require 'breizhipsum'`.

```ruby
text = Breizhipsum::Work.new({
  :paragraphs => 2, # default to 5
  :format     => :long, # default to :medium
  :html       => true # default to false
}).generate
```

### From CLI

Lauch `breizhipsum` in your terminal.

Use `breizhipsum help generate` for help.

## Contributing

1. Fork it ( https://github.com/angelodlfrtr/breizhipsum/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
