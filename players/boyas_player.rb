require File.expand_path('../../lib/player.rb', __FILE__)


class BoyasPlayer < Player
  def initialize(opponent)
    @results = {}
    @index   = 0
  end

  def choose
    get_best_guess
  end

  def possible_values
    [:rock, :paper, :scissors, :spock, :lizard]
  end

  def random
    @index = -1 if possible_values[@index].nil?

    return_value = possible_values[@index]

    @index += 1

    return_value
  end

  def get_best_guess
    guess = random
    initial_value = 0

    @results.each_pair do |key, value|
      if value > initial_value
        guess = key
      end
    end

    guess
  end

  def result(you, them, win_lose_or_draw)
    case win_lose_or_draw
    when :win
      up_score_of_item you.to_sym, 2
    when :draw
      up_score_of_item you.to_sym, -2
    when :lose
      up_score_of_item you.to_sym, -5
    end
  end

  private

  def get_score_by_item item
    @results[item]
  end

  def up_score_of_item item, score
    if get_score_by_item(item)
      @results[item] += score
    else
      @results[item] = score
    end
  end
end
