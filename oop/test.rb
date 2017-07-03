class Mastermind
	attr_accessor :code
	def initialize
		@colors = ['blue', 'green', 'pink', 'red', 'white', 'yellow']
		@code = []
		@past_guesses = ""
		@guesses_left = 12
		@solved = false
	end

	def set_up
		puts "Welcome to Mastermind. Can you crack the code? \n" 
		50.times {print "+"}
		print "\n"
		print_header
		puts "Guess the code or have the computer guess YOUR code. \nIf you want to create the code press 'c', otherwise just press enter..."
		choose_game
	end

	def choose_game
		input = gets.chomp.downcase
		if input == "c"
			puts "*** UNDER CONSTRUCTION ***"
		else
			self.play_game	
		end
	end

	def create_code #creates random array of 4 letters representing the code.
		4.times do 
			pick = @colors.sample
			@code<<pick[0]
		end
			
	end

	def play_game
			create_code
			while @guesses_left > 0 && @solved == false			
				puts "Please make your guess."
				get_guess
				draw_grid if !@solved
			end
			
			if @guesses_left == 0
				puts "You are out of guesses - GAME OVER"	
				puts "The code was #{@code.inspect}."
			end	
	end

	def get_guess
		user_guess = gets.chomp
		#run check that this is right length and just characterss
		this_guess = user_guess.chars.to_a #create new object  of guess class here
		guess_number = 13 - @guesses_left
		@guesses_left -= 1
		check_guess(this_guess)
	end


	def check_guess(guess)		
		a = @code.clone
		b = guess.clone
		guess_count = 1
		correct_guess = 0
			for i in 0..a.length-1
				if (a[i] == b[i])
					correct_guess = correct_guess + 1
					a[i] = nil
					b[i] = nil
				end
			end
		good_guess = 0	
			b.each do |x|
				if x == nil
					next
				end
				if a.include?(x)
					good_guess = good_guess + 1
					a[a.index(x)] = nil
				end	
			end	
		results = ""
		correct_guess.times {results << "."}
		good_guess.times {results << "^"}			
				

		@past_guesses << "#{guess.join(' ')}  |#{results}\n"
		print_header
		print @past_guesses
		if correct_guess == 4
			@solved = true
			puts "Congratulations! You have cracked the code."
		end
		
		
	end

	def print_header
		50.times {print "-"}
		print "\n"
		print "Colors: "
		@colors.each do |x|
			print "#{x[0]}: #{x}, "
		end
		2.times {print "\n"}
		puts ".= Correct color and position.\n^= Correct color."
		
		
	end

	def draw_grid

		@guesses_left.times do 
			puts "_ _ _ _"
		end
		puts "*******"		
	end



end	


game = Mastermind.new
game.set_up



#to do : computer solves code - create input check that can be used for code creation and guesses!!
