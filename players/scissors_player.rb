require File.expand_path('../../lib/player.rb', __FILE__)

class ScissorsPlayer < Player

  # Optional
  #
  # Called at the start of a math versus oppnent provided in +opponent+.
  # **Hint**: Player's __constructor__ sets @opponent
  #
  # Params:
  # - opponent [Class]: String of opponent's class name
  def initialize(opponent)
    @last_result = nil
    @last_played = nil
    @last_opp = nil
  end

  # Required
  #
  # Return your choice of :paper, :rock or :scissors
  def choose

    if @last_result == :lose
      @last_played
    elsif @last_result == :win
      arr = [:rock, :paper, :scissors]
      arr.delete_if {|item| item == @last_played }
      arr.sample
    elsif @last_result == :draw
      @last_opp
    else
      [:rock, :paper, :scissors].sample
    end

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
    @last_result = win_lose_or_draw
    @last_played = you
    @last_opp = them
  end

end
