require 'logger'
require 'outline'
require 'rainbow'

class FancyLogger < Logger
  def self.default_config
    @default_config ||= Outline.new do
      timestamp_format "%F %r"
      show_help_message true
      
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
        end
      end
    end
  end
  
  attr_writer :enabled
  
  def config(&blk)
    @config ||= self.class.default_config
    @config = Outline.new(data: self.class.default_config, &blk) if block_given?
    
    @config
  end
  
  def help_message
    message = "Log Styles:\n"
    
    config.styles.to_h.keys.each do |severity|
      message += " #{styled_string(severity, severity)}"
    end
    
    message += "\n\n"
  end
  
  def format_message(severity, timestamp, progname, msg)
    @the_help_message_has_been_displayed_before ||= false
    @enabled ||= true
    
    if @enabled
      message = ""
      
      if @the_help_message_has_been_displayed_before == false && config.show_help_message == true
        @the_help_message_has_been_displayed_before = true
        message += help_message
      end
      timestamp = styled_timestamp(severity, timestamp)
      
      message += "[#{timestamp}] #{msg}\n"
    else
      super
    end
  end
  
  protected
  
  def styled_string(severity, string)
    style = config.styles.send(severity.to_s.downcase.to_sym)
    string = string.to_s
    
    style.to_h.each do |key, value|
      key = :bright if key == :bold
      string = value == true ? string.send(key) : string.send(key, value)
    end
    
    string
  end
  
  def styled_timestamp(severity, timestamp)
    timestamp = timestamp.strftime(config.timestamp_format)
    
    styled_string(severity, timestamp)
  end
end