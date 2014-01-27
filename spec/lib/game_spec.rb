require 'spec_helper'

describe Game do

  before do
    @game = Game.new
  end

  it "initializes as Game" do
    @game.must_be_instance_of Game
  end

  it "starts the game" do
    Game.must_respond_to :run
    Game.run.must_be_instance_of Game
  end
end
