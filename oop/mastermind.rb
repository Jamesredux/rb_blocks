
class Mastermind

	def initialize
		puts "Welcome to Mastermind"".\n"
		@colors = ['blue', 'green', 'pink', 'red', 'white', 'yellow']
		@code = []
		@guess = []
		@no_of_guesses = 12
		@past_guesses = "" #string to append guesses to 

	end	

	def player_guess_setup
		
		print "Colors: "
		@colors.each do |x|
			print "#{x[0]}: #{x}, "
		end
		print "\n"
		puts ".= Correct color and position.\n^= Correct color."
		puts "Please make your guess."
		get_guess

	end

	def get_guess
		user_guess = gets.chomp
		#run check that this is right length and just characterss
		@guess = user_guess.chars.to_a
		check_guess
		puts @guess.inspect
		
	end

	def draw_grid
		@no_of_guesses.times do 
			puts "_ _ _ _"
		end
		puts "*******"	

	end

	def after_guess
		@no_of_guesses -= 1

		player_guess_setup
		past_guesses #method to display past guesses not made yet.  
		draw_grid
		
	end

	def past_guesses
		print @guess.join(' ')
		print ' |'
	end

	def create_code #creates random array of 4 letters representing the code.
		4.times do 
		pick = @colors.sample
		@code<<pick[0]
		end
			puts @code.inspect 
	end

	def letters
		@colors.each do |x|
			puts x[0]
		end
	end

	def check_guess
		this_guess = @guess
		code_inst = @code
		correct_col_pos = 0 
			for i in 0..3
				if this_guess[i] == code_inst[i]
					puts "you got one in the right place"
					this_guess[i],code_inst[i] = nil
					correct_col_pos += 1
					
				end
			end	
			past_guesses
	end		



end #end of setup class





game = Mastermind.new
game.create_code
game.player_guess_setup
game.draw_grid

