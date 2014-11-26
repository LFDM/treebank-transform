# Treebank::Transform

[![Version](http://allthebadges.io/LFDM/treebank-transform/badge_fury.png)](http://allthebadges.io/LFDM/treebank-transform/badge_fury)
[![Dependencies](http://allthebadges.io/LFDM/treebank-transform/gemnasium.png)](http://allthebadges.io/LFDM/treebank-transform/gemnasium)
[![Build Status](http://allthebadges.io/LFDM/treebank-transform/travis.png)](http://allthebadges.io/LFDM/treebank-transform/travis)
[![Coverage](http://allthebadges.io/LFDM/treebank-transform/coveralls.png)](http://allthebadges.io/LFDM/treebank-transform/coveralls)
[![Code Climate](http://allthebadges.io/LFDM/treebank-transform/code_climate.png)](http://allthebadges.io/LFDM/treebank-transform/code_climate)

Transforms Perseus Treebank Files.

Right now only a transformation of 1.5 files to the interim
[Arethusa](http://github.com/latin-language-toolkit/arethusa)
schema is supported. Elliptic nodes are handled differently these days.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'treebank-transform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install treebank-transform

## Usage

You can transform the example file from your command line to check the
output of this tool:

```
  $ treebank-transform do examples/cicero_catilina_sample.xml
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/treebank-transform/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
