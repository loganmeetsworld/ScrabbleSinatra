require "sinatra"
require "./lib/scrabble_master.rb"

class MySite < Sinatra::Base
	# Creates the home page which links to a scoring page
	get "/" do
		@title = "Scrabble"
		erb :index
	end

	get "/index.html" do 
		@title = "Scrabble"
		erb :index
	end

	# Creates the score page from the home page
	get "/score.html" do 
		@title = "Scrabble Scorecard"
		erb :score
	end

	# Writing out the score using POST
	post "/score.html" do
		@word_scored = true
		@word = params[:word]
		@score= Scrabble::Scrabble.score(@word)
		erb :score
	end

	# Creates a score page for multiple words 
	get "/score_multiple.html" do 
		@title = "Scrabble Scorecard: Multiple"
		erb :score_multiple
	end

	# Writing out the score using POST
	post "/score_multiple.html" do
		@words_scored = true
		@words = params[:words].split(', ')
		@scores = []
		@words.each do |word|
			@scores.push(Scrabble::Scrabble.score(word))
		end

		@list = @words.zip(@scores)
		@total = @scores.inject(:+)

		erb :score_multiple
	end
end