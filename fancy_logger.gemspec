# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fancy_logger"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-12-05"
  s.description = "# Fancy Logger\n\nAn easily customizable logger with style.\n\n## Install\n\n### Bundler: `gem 'fancy_logger'`\n\n### RubyGems: `gem install fancy_logger`\n\n## Usage\n\nSimply use as if you were using the normal Ruby `Logger` class:\n\n```ruby\nrequire 'fancy_logger'\n\nlogger = FancyLogger.new(STDOUT)\nlogger.info \"Hello\"\n```\n\n### Config\n\nThe `config` instance method allows you to modify the configuration of the Logger within a DSL.\n\nContinuing with our last example:\n\n```ruby\nlogger.config do\n  timestamp_format \"%c\"\n  \n  styles do\n    info do\n      foreground :yellow\n      blink true\n    end\n  end\nend\n\nlogger.debug   'Look here!'\nlogger.info    'Doing things...'\nlogger.warn    'Watch out!'\nlogger.error   'Bad'\nlogger.fatal   'VERY bad'\nlogger.unknown 'Weird unknown stuff'\n```\n\n#### Output\n\n![][output_example]\n\n### Config\n\n\n```ruby\n# The format of the timestamp in the log. Follows the strftime standards.\ntimestamp_format \"%F %r\"\n\n# On the first logged message, FancyLogger will prepend a help message\n# containing a list of all the severities (debug, info, warn, etc) styled\n# according to your config as reference.\n# You can disable this by setting the below option to false.\nshow_help_message true\n\n# Under styles, you have a configuration for each severity.\n# Each severity has a configuration with the following valid options:\n#   Key: foreground\n#   Value:\n#     :default, :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white\n#   \n#   Key: background\n#   Value:\n#     :default, :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white\n#   \n#   Key: reset\n#   Value: true or false\n#   \n#   Key: bright\n#   Value: true or false\n#   \n#   Key: italic\n#   Value: true or false\n#   \n#   Key: underline\n#   Value: true or false\n#   \n#   Key:\n#     blink\n#   Value: true or false\n#   \n#   Key: inverse\n#   Value: true or false\n#   \n#   Key: hide\n#   Value: true or false\nstyles do\n  debug do\n    foreground :black\n    background :cyan\n  end\n  \n  info do\n    foreground :default\n    background :default\n  end\n  \n  warn do\n    foreground :yellow\n    background :default\n    blink true\n  end\n  \n  error do\n    foreground :red\n    background :default\n  end\n  \n  fatal do\n    foreground :black\n    background :red\n    bold true\n    underline true\n  end\n  \n  unknown do\n    foreground :black\n    background :white\n    underline true\n  end\nend\n```\n\n## Contributing\n\n* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet\n* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it\n* Fork the project\n* Start or switch to a testing/unstable/feature/bugfix branch\n* Commit and push until you are happy with your contribution\n* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.\n* Please try not to mess with the Rakefile, VERSION or gemspec.\n\n## Copyright\n\nCopyright \u{a9} 2012 Ryan Scott Lewis <ryan@rynet.us>.\n\nThe MIT License (MIT) - See LICENSE for further details.\n\n[output_example]: http://oi44.tinypic.com/sfwlkp.jpg"
  s.email = "ryan@rynet.us"
  s.files = ["Gemfile", "LICENSE", "README.md", "Rakefile", "VERSION", "fancy_logger.gemspec", "lib/fancy_logger.rb", "spec/fancy_logger_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/RyanScottLewis/fancy_logger"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Colorize your logger."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<version>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<rainbow>, ["~> 1.1.3"])
      s.add_runtime_dependency(%q<outline>, ["~> 0.1.5"])
      s.add_development_dependency(%q<at>, ["~> 0.1"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.1"])
      s.add_development_dependency(%q<guard-yard>, ["~> 2.0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_development_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_development_dependency(%q<redcarpet>, ["~> 2.2.2"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<github-markup>, ["~> 0.7"])
    else
      s.add_dependency(%q<version>, ["~> 1.0.0"])
      s.add_dependency(%q<rainbow>, ["~> 1.1.3"])
      s.add_dependency(%q<outline>, ["~> 0.1.5"])
      s.add_dependency(%q<at>, ["~> 0.1"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.1"])
      s.add_dependency(%q<guard-yard>, ["~> 2.0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_dependency(%q<redcarpet>, ["~> 2.2.2"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<github-markup>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<version>, ["~> 1.0.0"])
    s.add_dependency(%q<rainbow>, ["~> 1.1.3"])
    s.add_dependency(%q<outline>, ["~> 0.1.5"])
    s.add_dependency(%q<at>, ["~> 0.1"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.1"])
    s.add_dependency(%q<guard-yard>, ["~> 2.0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    s.add_dependency(%q<fuubar>, ["~> 1.1"])
    s.add_dependency(%q<redcarpet>, ["~> 2.2.2"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<github-markup>, ["~> 0.7"])
  end
end
