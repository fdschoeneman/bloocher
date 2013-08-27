require 'turn'
require 'turn/autorun'
require 'turn/colorize'
require 'turn/reporter'

Turn.config do |c|
  
  c.natural = true
  c.ansi = true
  c.format = :progress
end

# format options: :pretty, :dot, :cue, :marshal, :outline, :progress). Default: :pretty