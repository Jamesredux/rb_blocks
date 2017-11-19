

require_relative '../lib/game.rb'




RSpec.describe Game do 
	before(:all) do 
		@game = Game.new
	end

	context '.initialize' do 
		it 'should be instance of Game class' do 
			expect(@game).to be_instance_of(Game)	
		end

		it 'should initialize with game_over as false' do 
			expect(@game.game_over).to be false
		end

		it 'should initialize with a turn count of 0' do 
			expect(@game.turn_count).to eq(0) 
		end
	end

	context '.check_win' do 
		before(:each) do 
			@game = Game.new
			
		end

		context '.check_win' do
			it 'should access squares' do 
				@board = instance_double(Board)
				expect(@board.squares).not_to be nil
			end

	end	
end

end
	














=begin 
1. tests that make sure players win when they should.
2. test each of the critical methods 
3. use mocks doubles to make sure they're sending back the correct outputs

methods to test 
board
	get_square
	valid_square
	square_free (this one could check with mock)

game
	update board 
	check win 
	check line
	play game

=end

# {"a"=>" ", "b"=>" ", "c"=>" ", "d"=>" ", "e"=>" ", "f"=>" ", "g"=>" ", "h"=>" ", "i"=>" ",}
