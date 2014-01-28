#require 'spec_helper'
require_relative '../../lib/game'
require_relative '../../players/example_player'
require_relative '../../players/best_player'
require 'rspec'

describe BestPlayer do
  let :game do
    Game.new ExamplePlayer, BestPlayer
  end
  
  it "unregisters the other player" do
    game.should_receive(:instance_variable_set).with(:@player1, an_instance_of(BestPlayer::Loser))
    game.play 1
  end

  it "wins" do
    game.play 100
    # puts game.results
    our_score = game.instance_variable_get(:@score2)
    their_score = game.instance_variable_get(:@score1)
    (our_score > their_score).should be_true
  end
end