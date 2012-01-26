require 'spec_helper'
require 'stringio'

describe FancyLogger do
  describe "The output of the logger" do
    let(:output) { StringIO.new }
    let(:logger) { FancyLogger.new(output) }
    
    it "should return a styled message based on the configuration" do
      logger.at.the_help_message_has_been_displayed_before = true
      # output.string.should =~ /\[\e\[30m\e\[43m\e\[5m/
    end
  end
end
