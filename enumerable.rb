

module Enumerable
	def my_each
		self.length.times do |i|
		yield(self[i])
		end
	end


	def my_each_with_index
		self.length.times do |i|
		yield(self[i], i)
		end
	end

	def  my_select   #this is just a guess lol seems to work
		selected = []
		self.my_each do |i|
			  if yield(i) 
			  
			 	selected.push(i)
				end			 		
	 	end
	 	puts selected.inspect
	end

	def my_all?
		all_pass = true
		self.my_each do |i|
			if yield(i) == false
					all_pass = false
			end
			
		end	
		puts all_pass
	end


 def my_any?
 	 any_true = false
 	 	self.my_each do  |i|
 	 		if yield(i) == true
 	 			any_true = true
 	 		end
 	 	end
 	 	puts any_true
 	 end

 	def my_none?
 		none_true = true
 			self.my_each do |i|
 				if yield(i) == true
 					none_true = false
 				end
 			end

 			puts none_true


 	end 




end



[1,2,6].my_each do |x|
	puts x
end

[1,2,6].my_each_with_index { |x, i| puts "the index is #{i} and the element is #{x}"}


[1,2,6].my_select do |item|
	item%2 ==0
end


[1,2,6].my_all? { |x| x <= 6}

[1,2,6].my_any? { |x| x == 6 }

[1,2,6].my_none?  { |x| x == 6 }