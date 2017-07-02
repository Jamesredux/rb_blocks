class Mastermind
	attr_accessor :code
	def initialize
		@colors = ['blue', 'green', 'pink', 'red', 'white', 'yellow']
		@code = []
		#@guess = ['r','r','g','y']
		@past_guesses = ""
		@guesses_left = 12
		@solved = false
	end

	def create_code #creates random array of 4 letters representing the code.
		4.times do 
		pick = @colors.sample
		@code<<pick[0]
		end
			puts @code.inspect 
	end

	def play_game
		while @guesses_left > 0 && @solved == false
			puts "Please make your guess."
			get_guess

		end
		if @guesses_left == 0
		puts "You are out of guesses - GAME OVER"	
		end	
	end

	def get_guess
		user_guess = gets.chomp
		#run check that this is right length and just characterss
		this_guess = user_guess.chars.to_a #create new object  of guess class here
		#guess_i = Guess.new(guess) would be what the creation of  the new object would be something like.
		guess_number = 13 - @guesses_left
		
		@guesses_left -= 1
		
		
		check_guess(this_guess)
		#post_result(this_guess, guess_number)
		#draw_grid
		
		
		
	end

	def game
		check
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
		
		puts "There are #{correct_guess} correct colors in the correct position."
		puts "There are #{good_guess} correct colors in the wrong position."
		

		@past_guesses << "#{guess.join(' ')}  |#{results}\n"
		print @past_guesses
		if correct_guess == 4
			@solved = true
			puts "The code has been broken"
		end
		
		
	end



end	


game = Mastermind.new
game.create_code
game.play_game



