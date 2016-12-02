# BrowserifySprockets

Implements a Sprockets Engine that allows for files with the extension `.browserify` to be processed by `browserify`.

## Installation

You can add the gem to your Gemfile with:

```ruby
gem 'browserify-sprockets'
```

## Requirements

`node` and `npm` must be installed and Browserify should be included as a dependency in your `package.json`.

## Usage

To use the module, first import it:

```ruby
require "browserify-sprockets"
```

Then bootstrap the Sprockets engine by calling `BrowserifySprockets.boostrap` with the locations of your `node_modules` directory and an array of directories where Browserify transforms may be located. For example:

```ruby
node_path = File.expand_path("../../../node_modules/", __FILE__)

transform_paths = [
  File.expand_path("../vendor/javascripts/", __FILE__),
  File.expand_path("../app/assets/javascripts/lib/", __FILE__)
]

BrowserifySprockets.bootstrap(node_path, transform_paths)
```

(see: [browserify-handbook#transforms](https://github.com/substack/browserify-handbook#transforms) for more information on transforms)

## License

BrowserifySprockets is released under the MIT license. See LICENSE for details.

