require File.expand_path('../../lib/player.rb', __FILE__)

class ExamplePlayer < Player

  # Optional
  #
  # Called at the start of a math versus oppnent provided in +opponent+.
  # **Hint**: Player's __constructor__ sets @opponent
  #
  # Params:
  # - opponent [Class]: String of opponent's class name
  def initialize(opponent)
  end

  # Required
  #
  # Return your choice of :paper, :rock or :scissors
  def choose
    [:rock, :paper, :scissors].sample
  end

  # Optional
  #
  # Called after each choice you make to give feedback
  #
  # Params:
  # - you [Symbol]: Your choice
  # - them [Symbol]: Your opponents choice
  # - win_lose_or_draw [Symbol]: holds the result of your choice
  def result(you, them, win_lose_or_draw)
  end

end
