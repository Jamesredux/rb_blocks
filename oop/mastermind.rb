
class Mastermind
	attr_accessor :code 

		def initialize
		puts "Welcome to Mastermind"".\n"
		@colors = ['blue', 'green', 'pink', 'red', 'white', 'yellow']
		@code = []
		@guesses_left = 12
		@past_guesses = "" #string to append guesses to 

	end	

	def player_guess_setup
		create_code
		print_header
		draw_grid
		get_guess
	end

	def play_game
		while @guesses_left > 0
			puts "Please make your guess."
			get_guess

		end
		puts "You are out of guesses - GAME OVER"	
		
	end

	def print_header
		print "Colors: "
		@colors.each do |x|
			print "#{x[0]}: #{x}, "
		end
		print "\n"
		puts ".= Correct color and position.\n^= Correct color."
		
		
	end

	def get_guess
		user_guess = gets.chomp
		#run check that this is right length and just characterss
		this_guess = user_guess.chars.to_a #create new object  of guess class here
		#guess_i = Guess.new(guess) would be what the creation of  the new object would be something like.
		guess_number = 13 - @guesses_left
		
		@guesses_left -= 1
		
		
		check_guess(this_guess)
		post_result(this_guess, guess_number)
		draw_grid
		
		
		
	end

	def check_guess(attempt)
		guess_a = attempt.clone
		code_a = @code.clone
		for i in 0..3
			if guess_a[i] == code_a[i]
				guess_a.delete_at(i)
				code_a.delete_at(i)
				guess_a[i] = nil
				
			end	
		end	
		puts code.inspect + "  this is the code through array"
		puts attempt.inspect + "  this is the guess through array"
		#puts attempt.inspect
		puts @code.inspect	
		
	end

	def post_result(this_guess, i)  #need to get check guess working first so that guess and result are returned...
		guess_record = []
		guess_record << this_guess


		
	end

	def draw_grid

		@guesses_left.times do 
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
		print "\n"
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

	


	



end #end of setup class

	


game = Mastermind.new
game.player_guess_setup

game.play_game

