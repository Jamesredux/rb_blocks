require_relative './board.rb'

class Game 
	attr_accessor :name, :squares, :board_mark, :player_turn
  
	def initialize
		@board = Board.new		
		@turn_count = 0  #to check for draws
		@game_over = false
		play_game
	end

	def play_game
		@board_mark = "X"
		@player_turn = "Player 1"	
		while @game_over == false
			self.update_board
		end
	end

	def update_board
		puts "#{player_turn} please choose your square."
		choice = @board.get_square
		@board.change_square(choice, @board_mark) 
		check_win 
		@turn_count += 1
			if @turn_count > 8 && @game_over == false    #the 2nd condition here is just to stop a double message when game is won on 9th turn!
				@game_over = true
				puts "It's a draw"
			end	
			switch_player
	end

	def switch_player
		if @board_mark == "X"
				 @board_mark = "O"
			 	 @player_turn = "Player 2"
			else
			 	@board_mark = "X"
			 	@player_turn = "Player 1"
			end
	end

	def check_win
		@win_lines = [['a','b','c'],['d','e','f'],['g','h','i'],['a','d','g'],['b','e','h'],['c','f','i'],['a','e','i'],['c','e','g']]	
		@win_lines.each do |line|      #iterate through the array of arrays of possible winning lines
			check_line(line)	
		end
	end	

	def check_line(line)
		score = 0
		line.each do |x|
			@board.squares.each do |k, v|  #now iterate through the hash to check if any winning lines have been created.
				if k == x && v == @board_mark
							score += 1
							if score > 2
			 					@game_over = true
			 					puts "GAME OVER #{@player_turn} is the winner"
			 					break   #this was put here to stop double message when 2 diagonal winning lines are created at the same time but it doesn't work!
							end 	
				end
		end
	end	
end	
end

game = Game.new
