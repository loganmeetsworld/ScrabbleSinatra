require "spec_helper"

describe "Player" do
  player = Scrabble::Player.new("Norman")
  player_2 = Scrabble::Player.new("Amy")
  player_3 = Scrabble::Player.new("Logan")

  describe "playing Scrabble" do
    #player initilization
    player.play("hello")
    player.play("eggs")
    player.play("coffee")

    #player_2 initialization
    player_2.play("quiz")
    player_2.play("number")
    player_2.play("handler")
    player_2.play("options")

    #player3 initilization
    player_3.play("")

    context "initializing" do
      it "returns a Player object" do
        expect(player).to be_an_instance_of Scrabble::Player
        expect(player_2).to be_an_instance_of Scrabble::Player
        expect(player_3).to be_an_instance_of Scrabble::Player
      end
      it "returns the Player name, #name" do
        expect(player.name).to eq "Norman"
        expect(player_2.name).to eq "Amy"
        expect(player_3.name).to eq "Logan"
      end
      it "returns an array of words played by the player, #plays" do
        expect(player.plays.class).to be Array
        expect(player_2.plays.class).to be Array
        expect(player_3.plays.class).to be Array
      end
    end

    it "adds word, #play(word)" do
      expect(player.plays).to eq ["hello", "eggs", "coffee"]
      expect(player_2.plays).to eq ["quiz", "number", "handler", "options"]
      expect(player_3.plays).to eq [""]
    end

    it "totals the score, #total_score" do
      expect(player.total_score).to eq 28
    end

    it "totals the score plus 50 when a seven letter word is used, #total_score" do
      expect(player_2.total_score).to eq 152
    end

    it "returns 0 when no words are played instead of an error, #total_score" do
      expect(player_3.total_score). to eq 0
    end

    it "returns false if under 100 points, #won?" do
      expect(player.won?).to eq false
      expect(player_2.won?).to eq true
    end

    it "returns the highest scoring word, #highest_scoring_word(word_array)" do 
      expect(player.highest_scoring_word(["hello", "this", "is", "the", "best"])).to eq "hello"
      expect(player_2.highest_scoring_word(["quiz", "number", "handler"])).to eq "handler"
    end

    it "returns the highest score, #highest_score" do
      expect(player.highest_word_score).to eq 8
      expect(player_2.highest_word_score). to eq 61
    end

    it "draws tiles from the tile bag" do
      expect((player.draw_tiles(Scrabble::TileBag.new)).length).to eq 7
    end
  end
end
