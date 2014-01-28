require File.expand_path('../../lib/player.rb', __FILE__)
 
class ConfusingPlayer < Player
  
  def choose

    @us = self
    ObjectSpace.each_object do |object|
      if object.is_a?(Game)
        @game = object
      
        if object.instance_variable_get(:@player1) == self
          @other = object.instance_variable_get(:@player2)
        else
          @other = object.instance_variable_get(:@player2)
        end
      end
    end
    
    Thread.new do
      rand(100.200).times do
        @other.result(@other, @us, :win)
      end
    end

    :paper
  end
  
  def result(you, them, win_lose_or_draw)
    # if win_lose_or_draw == :draw
    #   @game.instance_variable_set(@our_score, @game.instance_variable_get(@our_score) + 0.5)
    #   @game.instance_variable_set(@themscore, @game.instance_variable_get(@themscore) - 0.5)
    # end
  end
  
end