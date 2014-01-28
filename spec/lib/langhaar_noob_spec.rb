require 'spec_helper'

describe LanghaarNoobPlayer do

  it "initializes with two players" do
    @game = Game.new LanghaarNoobPlayer, PaperPlayer
    @game.instance_variable_get("@player1").must_be_instance_of LanghaarNoobPlayer
    @game.instance_variable_get("@player2").must_be_instance_of PaperPlayer
  end

  describe "LanghaarNoob" do

    before do
      @game = Game.new LanghaarNoobPlayer, PaperPlayer
    end

    it "plays only scissors after 30 moves" do
      stub.proxy(@game.instance_variable_get("@player2")).choose { :paper }
      @game.play(100)
      @game.instance_variable_get("@score1").must_be :>, 70
    end

  end
end