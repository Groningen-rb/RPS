require 'spec_helper'

describe Game do

  before do
    @game = Game.new
  end

  it "initializes as Game" do
    @game.must_be_instance_of Game
  end
end
