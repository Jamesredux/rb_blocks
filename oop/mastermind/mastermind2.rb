class Mastermind

	#this  is the same as the first mastermind.rb but with computer to solve.
	

	attr_accessor :code
	def initialize
		@colors = ['blue', 'green', 'pink', 'red', 'white', 'yellow']
		@colors_first_letter = []
		@code = []
		@past_guesses = ""
		@guesses_left = 12
		@solved = false
	end

	def set_up
		get_letters
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
			@code = get_code
			computer_solve(@user_code)
			#puts "*** UNDER CONSTRUCTION ***"
		else
			self.play_game	
		end
	end

	def create_code #creates random array of 4 letters representing the code.
		4.times do 
			pick = @colors.sample
			@code<<pick[0]
		end
		@code
	end

	def play_game
			create_code
			while @guesses_left > 0 && @solved == false			
				puts "Please make your guess."
				this_guess = get_guess
				check_guess(this_guess)
				draw_grid if !@solved
			end
			
			if @guesses_left == 0
				puts "You are out of guesses - GAME OVER"	
				puts "The code was #{@code.inspect}."
			end	
	end

	def get_guess
		user_guess = gets.chomp.chars 
		#guess_array = user_guess.chars 
		if right_length(user_guess) == false 
			puts "Please input 4 characters exactly"
			user_guess = get_guess 
		elsif valid_colors(user_guess) == false
			puts "You did not choose a valid color, try again"
			user_guess = get_guess
					
		end	

		
			
		
		puts user_guess.inspect
		user_guess

	end

	def right_length(input)
		if input.length == 4
			true
		else
			false
			
		end
		
	end

	def valid_colors(input)
	  if	input.all? { |x| @colors_first_letter.include?(x) }
			return true
		else
			return false
		end	
	end




	def check_guess(guess)	
		@guesses_left -= 1	
		a = @code.clone
		b = guess.clone
	#	guess_count = 1
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

	def check_input
		
	end

	def get_letters # i could just create an array of the first letter of each color but this makes it easier if I ever decide to change the colors

		@colors.each do |x|
			@colors_first_letter<<x[0]
		end
		
		
	end

################################USER CHOOSE CODE ####################

def get_code
	puts "Choose the colors that make up your code."
	print "Colors: "
		@colors.each do |x|
			print "#{x[0]}: #{x}, "

		end	
	puts "\n"	
	puts "---------------------"	
	@user_code = gets.chomp.chars	
	if right_length(@user_code) == false 
			puts "Please input 4 characters exactly"
			@user_code = get_code 
		elsif valid_colors(@user_code) == false
			puts "You did not choose a valid color, try again"
			@user_code = get_code
					
	end		
	puts @user_code.inspect
	@user_code
end

def computer_solve(code)
	while !@solved && @guesses_left > 0
		computer_guess(code)
	end



end

def computer_guess(code)
	#12.times do
		@comp_guess = create_code
		check_guess(@comp_guess)
		@guesses_left -= 1
			#	draw_grid if !@solved
	#end	
end

end	
	



game = Mastermind.new
game.set_up



#to do : computer solves code - create input check that can be used for code creation and guesses!!
