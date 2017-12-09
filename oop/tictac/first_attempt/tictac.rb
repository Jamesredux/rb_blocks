#this is the old method improved with game.rb in the lib dir

# a program to play tictactoe on the command line - made of the object orientated programming section of the odin project.

class Game 
	attr_accessor :name, :squares, :board_mark, :player_turn
  
	def initialize

		@bob = Board.new(@bob, {"a"=>" ", "b"=>" ", "c"=>" ", "d"=>" ", "e"=>" ", "f"=>" ", "g"=>" ", "h"=>" ", "i"=>" ",})
		@bob.display_map
		@bob.display_board	
		@board_mark = "X"
		@player_turn = "Player 1"		
		@turn_count = 0  #to check for draws
		@game_over = false
		@win_lines = [['a','b','c'],['d','e','f'],['g','h','i'],['a','d','g'],['b','e','h'],['c','f','i'],['a','e','i'],['c','e','g']]	
		
	end

	def play_game
		while @game_over == false
			self.update_board
		end
	end

	def update_board
		puts "#{player_turn} please choose your square."
		choice = @bob.get_square
		@bob.change_square(choice, @board_mark) 
		check_win 
		@turn_count += 1
			if @turn_count > 8 && @game_over == false    #the 2nd condition here is just to stop a double message when game is won on 9th turn!
				@game_over = true
				puts "It's a draw"
			end
			
			if @board_mark == "X"
				 @board_mark = "O"
			 	 @player_turn = "Player 2"
			else
			 	@board_mark = "X"
			 	@player_turn = "Player 1"
			end
	end

	def check_win
		
		@win_lines.each do |line|      #iterate through the array of arrays of possible winning lines
			check_line(line)	
		end
	end	

	def check_line(line)
		score = 0
		line.each do |x|
			@bob.squares.each do |k, v|  #now iterate through the hash to check if any winning lines have been created.
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


class Board
	attr_accessor :name, :squares, :board_mark, :player_turn

	def initialize(name, squares)
		@name = name
		@squares = squares
	end


	def display_board
		line1 = " #{@squares.values[0]} | #{@squares.values[1]} | #{@squares.values[2]} "
		line2 = " #{@squares.values[3]} | #{@squares.values[4]} | #{@squares.values[5]} "
		line3 = " #{@squares.values[6]} | #{@squares.values[7]} | #{@squares.values[8]} \n"

		puts line1,line2,line3		
	end	

	def display_map
		line1 = " #{@squares.keys[0]} | #{@squares.keys[1]} | #{@squares.keys[2]} "
		line2 = " #{@squares.keys[3]} | #{@squares.keys[4]} | #{@squares.keys[5]} "
		line3 = " #{@squares.keys[6]} | #{@squares.keys[7]} | #{@squares.keys[8]} \n"			
	
		puts "Choose one of the squares to place your mark..."
		puts line1,line2,line3
		puts "==========="
	end

	def change_square(choice, player_mark)
		 @squares.each do |k, v|
		 		if k = choice
		 		@squares[k] = player_mark
		 		end
		 end
		 	 self.display_board
	end

	def get_square
		square_choice = gets.chomp
			if valid_square(square_choice) == false
				puts "Please choose a square a - i ."
				square_choice = get_square
			elsif square_free(square_choice) == false
				puts "That square has been taken please choose another."
				square_choice = get_square
			end
				square_choice
	end		


	def valid_square(chk_sq)
		ok_squares = ['a','b','c','d','e','f','g','h','i']
			if ok_squares.include?(chk_sq)
				return true
			else
				return false
			end	
	end

	def square_free(chk_sq)  #checks if square has already been selected.
		if @squares[chk_sq] != " "
			return  false
		else
			return true
		end
	end	

end



game_test = Game.new
game_test.play_game


#this is a mess I think it can be rewritten better using oop if I work out how to call what method where and access varriable 
#it all depends how things are referenced eg @bob.squares or @squares etc. get_Square should be in game class

