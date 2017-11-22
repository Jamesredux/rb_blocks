require_relative '../lib/game2.rb'



RSpec.describe Game do 
let(:game)  { Game.new }

	describe '#initialize' do 
		it 'initializes game with 2 players' do 
			expect(game.player_1).not_to be nil
			expect(game.player_2).not_to be nil
		end

		it 'has game_over default to false' do 
			expect(game.game_over).to be false
		end

		it 'creates an instance of Board class' do
			expect(game.board).to be_instance_of(Board)
		end
	end



	describe '#valid_squares' do 
		it 'returns true for letters a..i' do 
			expect(game.valid_square('c')).to be true
		end

		it 'returns false for letters outside a..i' do 
			expect(game.valid_square('x')).to be false
		end

		it 'returns false for  double letters' do 
			expect(game.valid_square('cc')).to be false
		end	

		it 'returns false for non-letters' do 
			expect(game.valid_square('0')).to be false
		end		


		describe '#switch_player' do
			it 'switches player from default player 1 to player 2' do
				game.switch_player
				expect(game.player_turn.player_name).to eq("Player 2")
			end	

			it 'switches player from player 2 to player 1' do
				game.switch_player
				game.switch_player
				expect(game.player_turn.player_name).to eq("Player 1")
			end

		end	
	end	

	describe '#get_square' do
		it 'returns the square that is input' do
			new_square = Game.new
			allow(new_square).to receive(:gets).and_return('d')
			position  = new_square.get_square

			expect(position).to eq('d')

		end


	end	

	








end	