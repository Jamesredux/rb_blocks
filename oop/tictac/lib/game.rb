require_relative './board.rb'
require_relative './player.rb'

class Game
	attr_accessor :player_turn, :game_over, :player_1, :player_2, :board

	def initialize
		@board = Board.new
		@game_over = false
		@player_1 = Player.new
		@player_2 = Player.new('Player 2', 'o')
		@player_turn = @player_1
	end

	

	def display_map
		line1 = " a | b | c "
		line2 = " d | e | f "
		line3 = " g | h | i \n"			
	
		puts line1,line2,line3
		puts "==========="
	end

	def display_board
		line1 = " #{@board.board_grid[0]} | #{@board.board_grid[1]} | #{@board.board_grid[2]} "
		line2 = " #{@board.board_grid[3]} | #{@board.board_grid[4]} | #{@board.board_grid[5]} "
		line3 = " #{@board.board_grid[6]} | #{@board.board_grid[7]} | #{@board.board_grid[8]} \n"

		puts line1,line2,line3		
	end	

	def start_game
		puts "Welcome to tictactoe. \nChoose one of the squares a..i to place your mark..."	
		until @game_over == true
			play_game		
		end
	end

	def play_game
			display_map
			display_board
			puts "#{@player_turn.player_name} please choose a square."
			choice = get_square
			@board.update_grid(choice, @player_turn.player_mark)
			winner if @board.check_win
			game_draw if @board.check_draw
			switch_player
	end

	def get_square
		square_choice = gets.chomp
			if valid_square(square_choice) == false
				puts "Please choose a square a - i ."
				square_choice = get_square
			elsif @board.square_free(square_choice) == false
				puts "That square has been taken please choose another."
				square_choice = get_square
			end
			square_choice
	end		

	def valid_square(square_choice)
		ok_squares = ['a','b','c','d','e','f','g','h','i']
			if ok_squares.include?(square_choice)
				return true
			else
				return false
			end	
	end

	def winner
		@game_over = true
		display_board
		winner = @player_turn.player_name
		puts "Congratulations #{winner} is the winner."
	end

	def game_draw
		@game_over = true
		display_board
		puts 'The game is a draw.'
		
	end

	def switch_player
		if @player_turn == @player_1
			@player_turn = @player_2
		else
			@player_turn = @player_1
		end
	end

end	

game =  Game.new
game.start_game