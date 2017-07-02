class Mastermind
	attr_accessor :code
	def initialize
		@colors = ['blue', 'green', 'pink', 'red', 'white', 'yellow']
		@code = []
		@guess = ['r','r','g','y']
	end

	def create_code #creates random array of 4 letters representing the code.
		4.times do 
		pick = @colors.sample
		@code<<pick[0]
		end
			puts @code.inspect 
	end

	def game
		check
	end

	def check		
		a = @code.clone
		b = @guess.clone
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
		puts a.inspect
		puts b.inspect
		puts @code.inspect
		puts @guess.inspect
		puts "There are #{correct_guess} correct colors in the correct position."
		puts good_guess
	end



end	


game = Mastermind.new
game.create_code
game.game



