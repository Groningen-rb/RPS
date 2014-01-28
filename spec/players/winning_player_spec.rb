require 'spec_helper'
describe WinningPlayer do

  [ExamplePlayer, PaperPlayer].each do |player|
    it 'wins against example player' do
      nr_of_games = 100

      @game = Game.new(WinningPlayer, player)
      @game.play(nr_of_games)
      @game.instance_variable_get("@score1").must_equal nr_of_games
    end
  end
end