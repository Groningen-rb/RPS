require File.expand_path('../../lib/player.rb', __FILE__)

class ClearPlayer < Player
  def self.other; @other; end
  def self.other=(val); @other = val; end

  def initialize(other)
    self.class.other = other
  end

  def choose
    :paper
  end
end

at_exit do
  system("clear")
  puts "ClearPlayer vs. #{ClearPlayer.other}
    ClearPlayer: 100.0
    #{ClearPlayer.other}: 0.0
    ClearPlayer Wins"
end