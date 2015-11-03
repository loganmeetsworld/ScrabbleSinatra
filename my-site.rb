require "sinatra"

class MySite < Sinatra::Base
	get "/" do
		@title = "Scrabble"
		erb :index
	end

	get "/index.html" do 
		@title = "Scrabble"
		erb :index
	end

	get "/score.html" do 
		@title = "Scrabble Scorecard"
		erb :score
	end
end