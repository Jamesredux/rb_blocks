require_relative '../lib/player.rb'

RSpec.describe Player do 
let(:player)  { Player.new }

	context 'default player' do
		it 'is called player_1' do
			expect(player.player_name).to eq("Player 1")
		end

		it 'player mark is x' do 
			expect(player.player_mark).to eql("x")
		end
	end	

	context 'name and mark can be amended' do
		let(:player)  { Player.new("Test Player", "w") }
		it 'has a new name' do
			expect(player.player_name).to eq("Test Player")
		end

		it 'has a new player_mark' do 
			expect(player.player_mark).to eq("w")
		end
	end





end	

