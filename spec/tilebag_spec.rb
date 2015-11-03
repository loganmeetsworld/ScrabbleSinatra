require "spec_helper"

describe "TileBag" do
  before :each do
    @tilebag = Scrabble::TileBag.new
  end

  context "initializing" do
    it "returns a tilebag object" do
      expect(@tilebag).to be_an_instance_of Scrabble::TileBag
    end
    it "contains 98 tiles" do
      total_tiles = @tilebag.tiles.values.inject{|sum, x| sum + x }
      expect(total_tiles).to eq 98
    end
  end

  context "drawing tiles" do
    it "doesn't allow you to draw more than seven or less than zero" do
      expect(@tilebag.draw_tiles(10)).to eq "Cannot draw that amount of tiles."
      expect(@tilebag.draw_tiles(-2)).to eq "Cannot draw that amount of tiles."
      expect((@tilebag.draw_tiles(7)).class).to be Array
    end

	  it "returns random tiles" do
	    expect(@tilebag.draw_tiles(7)).not_to eq @tilebag.draw_tiles(7)
	  end

    it "returns the correct remaining tiles" do
      @tilebag.draw_tiles(7)
      expect(@tilebag.tiles_remaining).to eq 91
    end
  end# it "removes tiles from default set" do
  #   expect(drawn_tiles)
  # end
end
