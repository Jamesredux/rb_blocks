
class Board
	attr_accessor :name, :squares, :board_mark, :board

	def initialize
		@squares = {"a"=>" ", "b"=>" ", "c"=>" ", "d"=>" ", "e"=>" ", "f"=>" ", "g"=>" ", "h"=>" ", "i"=>" ",}
	end

	def display_map
		line1 = " #{@squares.keys[0]} | #{@squares.keys[1]} | #{@squares.keys[2]} "
		line2 = " #{@squares.keys[3]} | #{@squares.keys[4]} | #{@squares.keys[5]} "
		line3 = " #{@squares.keys[6]} | #{@squares.keys[7]} | #{@squares.keys[8]} \n"			
	
		puts "Choose one of the squares to place your mark..."
		puts line1,line2,line3
		puts "==========="
	end

	def display_board
		line1 = " #{@squares.values[0]} | #{@squares.values[1]} | #{@squares.values[2]} "
		line2 = " #{@squares.values[3]} | #{@squares.values[4]} | #{@squares.values[5]} "
		line3 = " #{@squares.values[6]} | #{@squares.values[7]} | #{@squares.values[8]} \n"

		puts line1,line2,line3		
	end	

	def change_square(choice, player_mark)
		 @squares.each do |k, v|
		 		if k = choice
		 			@squares[k] = player_mark
		 		end
		 end
		 	self.display_map
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

