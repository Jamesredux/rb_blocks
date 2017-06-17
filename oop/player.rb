class Player
	attr_accessor :name, :marker

	def initialize(name, marker)
		@name = name
		@marker = marker
	end


end

p_one = Player.new("player1", "X")
p_two = Player.new("player2" ,"O")

