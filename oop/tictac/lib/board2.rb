
class Board

	attr_accessor :board_grid

	def initialize
		@board_grid = Array.new(9, " ")
		@board_index = {"a"=> 0, "b"=> 1, "c"=> 2, "d"=> 3, "e"=> 4, "f"=> 5, "g"=> 6, "h"=> 7, "i"=> 8}
	end


	def find_grid_index(choice)
		#method that takes players letter choice and convert it to index of grid and returns that number		
	end

	def check_win
		win_lines = [ [@board_grid[0],@board_grid[1],@board_grid[2]],
									[@board_grid[3],@board_grid[4],@board_grid[5]],
									[@board_grid[6],@board_grid[7],@board_grid[8]],
									[@board_grid[0],@board_grid[3],@board_grid[6]],
									[@board_grid[1],@board_grid[4],@board_grid[7]],
									[@board_grid[2],@board_grid[5],@board_grid[8]],
									[@board_grid[0],@board_grid[4],@board_grid[8]],
									[@board_grid[2],@board_grid[4],@board_grid[6]]
								]
		win_lines.each do |line|
			result = line.uniq
			return true if result == ['x'] || result == ['o']
		end
		false
	end

	def check_draw
		if @board_grid.include?(' ') || check_win  
			return false
		else
			return true
		end
	end

	def square_free(square)
		square_index = @board_index[square]
		if @board_grid[square_index] != ' '
			return false
		else
			return true
		end		
	
	end

	def update_grid(square, player_mark)
		square_index = @board_index[square]
		@board_grid[square_index] = player_mark
		
	end



end

