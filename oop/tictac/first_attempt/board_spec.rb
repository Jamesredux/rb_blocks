require_relative '../lib/board.rb'

RSpec.describe Board do 
	let(:board) { Board.new }

	context '.initialize' do 

		it 'creates squares hash' do 
			expect(board.squares).to be_instance_of(Hash)
		end

		it 'has attributes' do 
			expect(board).to have_attributes(squares: {"a"=>" ", "b"=>" ", "c"=>" ", "d"=>" ", "e"=>" ", "f"=>" ", "g"=>" ", "h"=>" ", "i"=>" ",})
		end
	end



	context 'it checks square is on the board' do 
		it 'returns true for letters a-i' do 
			expect(board::valid_square('a')).to eq(true)
		end

		it 'returns false for any other letter' do 
			expect(board.valid_square('v')).to eq(false)
		end

		it 'returns false for more than one letter' do 
			expect(board.valid_square('ab')).to eq(false)
		end

		it 'returns false for non alpha char' do 
			expect(board.valid_square('&')).to eq(false)
		end

	end


	context ':square_free' do 
		before(:each) do 
			@board = Board.new
			@board.squares = {"a"=>"x", "b"=>" ", "c"=>" ", "d"=>" ", "e"=>" ", "f"=>" ", "g"=>" ", "h"=>" ", "i"=>" ",}
		end
		it 'returns true for empty squares' do 
			expect(@board.square_free('d')).to eq(true)
		end	

		it 'returns false for occupied squares' do 
			expect(@board.square_free('a')).to eq(false)
		end	

		it 'returns false for invalid squares' do 
			expect(@board.square_free('v')).to eq(false)
		end

		
	end	




end
