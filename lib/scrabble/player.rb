module Scrabble
	class Player

		attr_accessor :name, :plays

		def initialize(name)
			@name = name
			@plays = []
			@bag = nil
			@current_tiles = []
		end

		def won?
			if total_score >= 100
				return true
			else
				return false
			end
		end

		def play(word)
			if won?
				false
			else
				@plays.push(word.downcase)
			end
		end

		def total_score
			total = 0

			@plays.each do |word|
				total += Scrabble.score(word.downcase).to_i
			end

			return total
		end

		def highest_scoring_word(word_array)
			@highest_score_word = Scrabble.highest_score_from(word_array)
			return @highest_score_word
		end

		def highest_word_score
			return Scrabble.score(@highest_score_word)
		end

		def draw_tiles(tile_bag)
			@bag = tile_bag
			new_tiles = []

			new_tiles.push(tile_bag.draw_tiles(7 - @current_tiles.length))
			
			tile_array = @current_tiles.push(new_tiles)
			tile_array.flatten!
		end
	end
end
