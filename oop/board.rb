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


	def change_square(choice)
		 @squares.each do |k, v|
		 	if k = choice
		 	@squares[k] = "x"
		 	end
		 	
		 end
		 	
		 	 
		 	 self.display_board
	end

	def get_square  

			ok_squares = ['a','b','c','d','e','f','g','h','i']		
			square_choice = ""
			user_input = false
			while user_input == false
			puts "Please enter a square a-i"	
			 square_choice = gets.chomp

			 if @squares[square_choice] == 'x'
			 		puts "That square is taken, please choose another."
			 		square_choice = gets.chomp
			 	
			 elsif 
			 		ok_squares.include?(square_choice)
			 				user_input = true

			  else
			 	puts "Thats not a valid choice"
					square_choice = gets.chomp
					end

				
				
			
			
					
			end
			square_choice
	end

	

end

