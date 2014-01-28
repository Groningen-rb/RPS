require 'spec_helper'

describe Game do

  it "initializes with two players" do
    @game = Game.new ExamplePlayer, PaperPlayer
    @game.instance_variable_get("@player1").must_be_instance_of ExamplePlayer
    @game.instance_variable_get("@player2").must_be_instance_of PaperPlayer
  end

  describe "player 1 wins a turn when" do

    before do
      @game = Game.new ExamplePlayer, PaperPlayer
    end

    it "plays scissors on paper" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :scissors }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :paper }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays paper on rock" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :paper }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :rock }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays rock on lizard" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :rock }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :lizard }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays lizard on spock" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :lizard }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :spock }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays spock on scissors" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :spock }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :scissors }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays scissors on lizard" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :scissors }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :lizard }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays lizard on paper" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :lizard }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :paper }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays paper on spock" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :paper }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :spock }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays spock on rock" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :spock }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :rock }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

    it "plays rock on scissors" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :rock }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :scissors }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 1
      @game.instance_variable_get("@score2").must_equal 0
    end

  end

  describe 'player1 loses when' do

    before do
      @game = Game.new ExamplePlayer, PaperPlayer
    end

  end

  describe 'player1 and player2 draw turn when they both' do

    before do
      @game = Game.new ExamplePlayer, PaperPlayer
    end

    it "play rock" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :rock }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :rock }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 0.5
      @game.instance_variable_get("@score2").must_equal 0.5
    end

    it "play paper" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :paper }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :paper }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 0.5
      @game.instance_variable_get("@score2").must_equal 0.5
    end

    it "play scissors" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :scissors }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :scissors }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 0.5
      @game.instance_variable_get("@score2").must_equal 0.5
    end

    it "play lizard" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :lizard }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :lizard }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 0.5
      @game.instance_variable_get("@score2").must_equal 0.5
    end

    it "play spock" do
      stub.proxy(@game.instance_variable_get("@player1")).choose { :spock }
      stub.proxy(@game.instance_variable_get("@player2")).choose { :spock }
      @game.play(1)
      @game.instance_variable_get("@score1").must_equal 0.5
      @game.instance_variable_get("@score2").must_equal 0.5
    end
  end

end
