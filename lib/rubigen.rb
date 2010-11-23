$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support/core_ext/class/inheritable_attributes'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'

module RubiGen
  VERSION = '1.5.5'
end

require 'rubigen/base'
require 'rubigen/lookup'
require 'rubigen/commands'

RubiGen::Base.send(:include, RubiGen::Lookup)
RubiGen::Base.send(:include, RubiGen::Commands)

# Set up a default logger for convenience.
require 'rubigen/simple_logger'
RubiGen::Base.logger = RubiGen::SimpleLogger.new(STDOUT)

# Use self as default lookup algorithm
# If your framework needs to subclass RubiGen::Base, then
# assign it to #active after initialising rubigen and your code.
RubiGen::Base.active = RubiGen::Base

