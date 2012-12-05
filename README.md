# fancy_logger

An easily customize Logger with style.

## Install

### Bundler: `gem 'fancy_logger'`

### RubyGems: `gem install fancy_logger`

## Usage

Simply use as if you were using the normal Ruby `Logger` class:

```ruby
require 'fancy_logger'

logger = Logger.new(STDOUT)
logger.info "Hello"
```

### Config

The `config` instance method allows you to modify the configuration of the Logger within a DSL.

Continuing with our last example:

```ruby
logger.config do
  timestamp_format "%c"
  
  styles do
    info do
      foreground :yellow
      blink true
    end
  end
end

logger.debug   'Look here!'
logger.info    'Doing things...'
logger.warn    'Watch out!'
logger.error   'Bad'
logger.fatal   'VERY bad'
logger.unknown 'Weird unknown stuff'
```

#### Output

![][output_example]

### Config


```ruby
# The format of the timestamp in the log. Follows the strftime standards.
timestamp_format "%F %r"

# On the first logged message, FancyLogger will prepend a help message
# containing a list of all the severities (debug, info, warn, etc) styled
# according to your config as reference.
# You can disable this by setting the below option to false.
show_help_message true

# Under styles, you have a configuration for each severity.
# Each severity has a configuration with the following valid
# options:
#   Key:
#     foreground
#   Value:
#     :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, or :default
#   
#   Key:
#     background
#   Value:
#     :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :default
#   
#   Key:
#     reset
#   Value:
#     true or false
#   
#   Key:
#     bright
#   Value:
#     true or false
#   
#   Key:
#     italic
#   Value:
#     true or false
#   
#   Key:
#     underline
#   Value:
#     true or false
#   
#   Key:
#     blink
#   Value:
#     true or false
#   
#   Key:
#     inverse
#   Value:
#     true or false
#   
#   Key:
#     hide
#   Value:
#     true or false
styles do
  debug do
    foreground :black
    background :cyan
  end
  
  info do
    foreground :default
    background :default
  end
  
  warn do
    foreground :yellow
    background :default
    blink true
  end
  
  error do
    foreground :red
    background :default
  end
  
  fatal do
    foreground :black
    background :red
    bold true
    underline true
  end
  
  unknown do
    foreground :black
    background :white
    underline true
  end
end
```


```ruby

```

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start or switch to a testing/unstable/feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, VERSION or gemspec.

## Copyright

Copyright © 2012 Ryan Scott Lewis <ryan@rynet.us>.

The MIT License (MIT) - See LICENSE for further details.

[output_example]: http://oi44.tinypic.com/sfwlkp.jpg