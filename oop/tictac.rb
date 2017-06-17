

class Game 
	attr_accessor :name, :squares, :board_mark, :player_turn
  


	def initialize

		@bob = Board.new(@bob, {"a"=>" ", "b"=>" ", "c"=>" ", "d"=>" ", "e"=>" ", "f"=>" ", "g"=>" ", "h"=>" ", "i"=>" ",})

		@bob.display_map
		@bob.display_board	
		@board_mark = "X"
		@player_turn = "Player 1"		
		@game_over = false	
		
	end

	def play_game
		while @game_over == false
			self.update_board
		end
	end

	
	

	def update_board

		puts "#{player_turn} please choose your square."
		player_mark = @board_mark
		choice = @bob.get_square
		#@bob.square_free(choice)
		@bob.change_square(choice, player_mark)  
		if @board_mark == "X"
			 @board_mark = "O"
			 @player_turn = "Player 2"
		else
			 @board_mark = "X"
			 @player_turn = "Player 1"
		end	 





		



end

class Board
		attr_accessor :name, :squares

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
	
		puts "Choose on of the squares to place your mark..."
		puts line1,line2,line3
		puts "===========\n==========="
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
			square_choice = ""
			ok_squares = ['a','b','c','d','e','f','g','h','i']		
			until ok_squares.include?(square_choice) 
				puts "Please input a square from a-i"
				square_choice = gets.chomp
			end
			square_free(square_choice)
			square_choice
	end

	


end	




end



clive = Game.new

#clive.set_up


clive.update_board

clive.update_board

clive.update_board
clive.update_board
clive.update_board
clive.update_board


