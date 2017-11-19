require_relative '../lib/board2.rb'


RSpec.describe Board do 
	let(:board) { Board.new }

	context 'initialize' do 
		it 'creates board' do 
			expect(board).to be_instance_of(Board)
		end

		it 'creates board_grid array' do 
			expect(board.board_grid).to be_instance_of(Array)
		end

		it 'populates array with 9 spaces' do 
			expect(board.board_grid[7]).to eq(' ')
		end
	end

	context '.check_win' do 

		it 'returns false as default' do
			expect(board.check_win).to eq(false)
		end

		it 'returns true with winning row' do 
			board.board_grid = ['x','x','x',' ',' ',' ',' ',' ',' ']
			expect(board.check_win).to eq(true)
		end

		it 'returns true with winning column' do 
			board.board_grid = ['x',' ','o',' ',' ','o','x',' ','o']
			expect(board.check_win).to eq(true)
		end

		it 'returns true with winning diagonal' do 
			board.board_grid = ['x',' ',' ',' ','x',' ',' ',' ','x']
			expect(board.check_win).to eq(true)
		end

		it 'returns false for a drawn game' do 
			board.board_grid = ['x','x','o','o','x','x','x','o','o']
			expect(board.check_win).to eq(false)
		end
	end	

	context '.check_draw' do 
		it 'returns false by default'do 
			expect(board.check_draw).to eq(false)
		end

		it 'returns true for full grid with no winner' do 
			board.board_grid = ['x','x','o','o','x','x','x','o','o']
			expect(board.check_draw).to eq(true)
		end

		it 'returns falses for full grid with winner' do 
			board.board_grid = ['x','x','x','o','x','x','x','o','o']
			expect(board.check_draw).to eq(false)
		end

		it 'returns false for grid with winner' do 
			board.board_grid = ['x','x','x',' ',' ',' ',' ','o','o']
			expect(board.check_draw).to eq(false)
		end
	end

	context '.square_free' do 
		it 'returns true when square unoccupied' do 
			expect(board.square_free('a')).to eq(true)
		end

		it 'returns false when square is occupied' do
			board.board_grid[0] = 'x'
			expect(board.square_free('a')).to eq(false)
		end


	end


end
