require File.expand_path('../../lib/player.rb', __FILE__)
class MTNWPlayer < Player

  attr_accessor :history_me
  attr_accessor :history_them

  def initialize(opponent)
    super
    @history_them = []
    @history_me = []
  end

  def choose
    if @history_them.size > 0 && @history_me.size > 0

      if @history_them.last(2) == :paper 
        return :paper  
      elsif @history_them.last(2) == :scissors 
        return :scissors  
      elsif @history_them.last(2) == :rock 
        return :rock

      else

        if @history_them.last == :paper && @history_me.last == :rock
          return :scissors
        elsif @history_them.last == :rock && @history_me.last == :scissors
          return :paper
        elsif @history_them.last == :scissors && @history_me.last == :paper
          return :rock
        elsif @history_them.last == :rock && @history_me.last == :paper
          return :scissors
        elsif @history_them.last == :scissors && @history_me.last == :rock
          return :paper
        elsif @history_them.last == :paper && @history_me.last == :scissors
          return :rock
        else
          return [:scissors, :paper, :rock].sample
        end
      end

    else
      return [:scissors, :paper, :rock].sample
    end
  end

  def result(you, them, win_lose_or_draw)
    @history_me << you
    @history_them << them
  end

end