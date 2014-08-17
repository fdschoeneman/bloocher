require 'turn'
require 'turn/autorun'
require 'turn/colorize'
require 'turn/reporter'

Turn.config do |c|
  
  c.natural = false
  c.ansi = true
  c.format = :progress
end

# format options: :pretty, :dot, :cue, :marshal, :outline, :progress). Default: :pretty