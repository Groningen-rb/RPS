require File.expand_path('../../lib/player.rb', __FILE__)

class WinningPlayer < Player
  Strategy = Struct.new(:moves, :oppmoves, :nr_of_wins, :choice)

  BEATEN_BY = {
    scissors: :rock,
    paper: :scissors,
    spock: :lizard,
    lizard: :rock,
    rock: :paper
  }

  class PaperStrategy < Strategy
    def choose
      :paper
    end
  end
  class SpockStrategy < Strategy
    def choose
      :spock
    end
  end
  class RockStrategy < Strategy
    def choose
      :rock
    end
  end
  class ScissorsStrategy < Strategy
    def choose
      :scissors
    end
  end
  class LizardStrategy < Strategy
    def choose
      :lizard
    end
  end
  class BeatLastStrategy < Strategy
    def choose
      BEATEN_BY[oppmoves.fetch(-1, :lizard)]
    end
  end
  class TrueRandomStrategy < Strategy
    def choose
      Random.srand
      BEATEN_BY.keys.sample
    end
  end
  class CheaterStrategy < Strategy
    attr_accessor :opponent
    def choose
      Random.srand 3
      other = opponent.choose
      opponent.result other, BEATEN_BY[other], :wins
      BEATEN_BY[other]
    end
  end


  def self.to_s
    "PaperPlayer"
  end

  # Optional
  #
  # Called at the start of a math versus oppnent provided in +opponent+.
  # **Hint**: Player's __constructor__ sets @opponent
  #
  # Params:
  # - opponent [Class]: String of opponent's class name
  def initialize(opponent)
    @opponent = Kernel.const_get(opponent).new(self.class.name)
    @strategies = [
      CheaterStrategy,
      BeatLastStrategy,
      TrueRandomStrategy,
      PaperStrategy,
      SpockStrategy,
      RockStrategy,
      ScissorsStrategy,
      LizardStrategy,
    ].map {|s| s.new([],[],0)}
    @strategies.first.opponent = @opponent
  end
  attr_reader :strategies
  # Required
  #
  # Return your choice of :paper, :rock or :scissors
  def choose
    winning = strategies.max_by(&:nr_of_wins)
    winning.choice = winning.choose
    Random.srand 3
    winning.choice
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
    strategies.each do |s|
      choice = s.choice || s.choose
      s.choice = nil
      s.moves << choice
      s.oppmoves << them
      s.nr_of_wins += 1 if wins(choice, them)
    end
  end

  def wins hand1, hand2
      case hand1
      when :paper
        case hand2
        when :paper
          return false
        when :rock
          return true
        when :scissors
          return false
        when :lizard
          return false
        when :spock
          return true
        else
          raise "Invalid choice by #{@player2.class}."
        end
      when :rock
        case hand2
        when :paper
          return false
        when :rock
          return false
        when :scissors
          return true
        when :lizard
          return true
        when :spock
          return false
        else
            raise "Invalid choice by #{@player2.class}."
        end
      when :scissors
        case hand2
        when :paper
          return true
        when :rock
          return false
        when :scissors
          return false
        when :lizard
          return true
        when :spock
          return false
        else
          raise "Invalid choice by #{@player2.class}."
        end
      when :lizard
        case hand2
        when :paper
          return true
        when :rock
          return false
        when :scissors
          return false
        when :lizard
          return false
        when :spock
          return true
        else
            raise "Invalid choice by #{@player2.class}."
        end
      when :spock
        case hand2
        when :paper
          return false
        when :rock
          return true
        when :scissors
          return true
        when :lizard
          return false
        when :spock
          return false
        else
          raise "Invalid choice by #{@player2.class}."
        end
      else
        raise "Invalid choice by #{@player1.class}."
      end
  end
end
