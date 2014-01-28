require File.expand_path('../../lib/player.rb', __FILE__)

class LanghaarNoobPlayer < Player
  CHOICES = [:rock, :paper, :scissors]

  # Optional
  #
  # Called at the start of a math versus oppnent provided in +opponent+.
  # **Hint**: Player's __constructor__ sets @opponent
  #
  # Params:
  # - opponent [Class]: String of opponent's class name
  def initialize(opponent)
    @turn = 0
    @next_move = nil
    @opponent_choices = Array.new(CHOICES.length) { 0 }
  end

  # Required
  #
  # Return your choice of :paper, :rock or :scissors
  def choose
    if @next_move
      @next_move
    else
      CHOICES.sample
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
    @opponent_choices[CHOICES.index(them)] += 1
    if @turn > 30
      them_fav = CHOICES[@opponent_choices.each_with_index.max[1]]
      @next_move = case them_fav
        when :rock
          :paper
        when :paper
          :scissors
        else
          :rock
        end
      puts "Fav was #{them_fav}, we choose #{@next_move}"
    end
    @turn += 1
  end

end
