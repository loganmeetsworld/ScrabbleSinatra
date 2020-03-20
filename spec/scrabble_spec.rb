require "spec_helper"

describe Scrabble::Scrabble do
  describe "#score" do
    it "only takes characters that are letters" do
      expect(Scrabble::Scrabble.score("")).to eq "That is not a valid word."
      expect(Scrabble::Scrabble.score("83uejd9w0220330")).to eq "That is not a valid word."
      expect(Scrabble::Scrabble.score(" ")).to eq "That is not a valid word."
    end

    it "only takes seven letters" do
      expect(Scrabble::Scrabble.score("calculator")).to eq "Cannot have more than seven letters."
      # expect(Scrabble::Scrabble.score("handler")).to eq "Cannot have more than seven letters."
    end

    it "adds points properly" do
      expect(Scrabble::Scrabble.score("hello")).to eq 8
      expect(Scrabble::Scrabble.score("quiz")).to eq 22
      expect(Scrabble::Scrabble.score("it")).to eq 2
      expect(Scrabble::Scrabble.score("HanDLeR")).to eq 61
    end

    it "doesn't accept non-dictionary words" do 
      expect(Scrabble::Scrabble.score("zzzzzzz")).to eq "That is not a valid word."
      expect(Scrabble::Scrabble.score("goopgoopgoop")).to eq "That is not a valid word." #more than seven, but not valid first
    end#end of it "adds points properly" block

    it "adds 50 points for seven letter words" do
      expect(Scrabble::Scrabble.score("bundles")).to eq 60
    end

  end#end of describe score do block

  describe "#highest_score_from" do
    it "returns word with highest score under normal circumstances" do
      expect(Scrabble::Scrabble.highest_score_from(["hello", "quiz", "it", "HanDLeR"])).to eq "handler"
    end#end of it returns word with highest score block

    it "returns the shortest of words with the same points" do
      expect(Scrabble::Scrabble.highest_score_from(["hello", "word", "it", "no"])).to eq "word"
      expect(Scrabble::Scrabble.highest_score_from(["hello", "word", "it", "no", "dance"])).to eq "word"
    end#end of it returns the shortest of words block
    
    it "returns the first word when two words have equal length and points" do
      expect(Scrabble::Scrabble.highest_score_from(["hello", "dance", "cat", "on", "it"])).to eq "hello"
    end
    
    it "returns the first word when two words have equal length and points" do
      expect(Scrabble::Scrabble.highest_score_from(["dance","hello", "cat", "on", "it"])).to eq "dance"
    end
    
    it "has seven letter word win in event of tie" do
      expect(Scrabble::Scrabble.highest_score_from(["quiz", "bundles", "cat"])).to eq "bundles"
      expect(Scrabble::Scrabble.highest_score_from(["quizzes", "bundles", "cat"])).to eq "quizzes"
    end
    
  end#end of describe #highest_score_from block
end#end of describe Scrabble::Scrabble do block
