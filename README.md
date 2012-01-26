# fancy_logger

An easily customizable logger with style.

## Installing

Add to your `Gemfile`:

```ruby
gem 'fancy_logger'
```

Or simply:

```bash
$ gem install fancy_logger
````

## Examples

Simply use as if you were using the normal Ruby `Logger` class:

```ruby
require 'fancy_logger'

LOGGER = FancyLogger.new(STDOUT)
LOGGER.info "Hello"
```

### Config

Continuing with our last example:

```ruby
LOGGER.config do
  timestamp_format "%c"
  
  styles do
    info do
      foreground :yellow
      blink true
    end
  end
end

LOGGER.info "Hello"
```

### Default Config

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