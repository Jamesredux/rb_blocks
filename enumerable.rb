

module Enumerable
	def my_each
		for i in self 
		yield(i)
		end
	end


	def my_each_with_index
		self.length.times do |i|
		yield(self[i], i)
		end
	end

	def  my_select   
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


 	def my_count(arg = nil)
 		count = 0
 			self.my_each do |i|
 				if block_given? 
 					if yield(i) == true 
 						count += 1
 					end
 				elsif arg 
 					count += 1 if arg == i 
 						
 				else 
 					count  = self.length
 				end
 			end

 			puts count 


 	end	

 	def my_map
 		map_return = []
 			self.my_each do  |i|
 				map_return<<(yield(i))
 			end	

 			puts map_return.inspect

 	end

#my_map takes proc - will take a proc or block not sure 
#how or why it could take both 

 	def my_map(some_proc = nil) 
 		map_return = []
 		
 		if some_proc || some_proc && block_given?
 			self.my_each do |i|
 			map_return<<some_proc.call(i)
 			end
		else 	
 			self.my_each do  |i|
 				map_return<<(yield(i))
 			
 			end
 		end	 	
 			puts map_return.inspect

 	end


 	def my_inject(arg =nil)  
 		
		total = arg.nil? ? first : arg		
 		my_each { |i| total = yield(total, i)}    #not sure why my solution wasn't
 																								#working had to copy someone else
 																								#has problems with 1st element
 		puts total
 	end		
 	

 	


end

def multiply_els(array)
 		array.my_inject { |arg,x| arg * x }  

 	end	


#######TESTS################
puts "!!!my_each test!!!"
[1,2,6].my_each do |x|
	puts x
end
puts "!!!my_each_with_index test!!!"
[1,2,6].my_each_with_index { |x, i| puts "the index is #{i} and the element is #{x}"}
puts "!!!my_select test!!!"
[1,2,6].my_select do |item|
	item%2 ==0
end
puts "!!!my_all test!!!"
[1,2,6].my_all? { |x| x <= 6}
puts "my_any test"
[1,2,6].my_any? { |x| x == 6 }
puts "my_none test"
[1,2,6].my_none?  { |x| x == 6 }
puts "my_count test"
[1,2,6].my_count { |x| x%2 == 0 }  #2
puts "my_map test"
[1,2,6].my_map { |x| x+3 }
puts "my_inject test"
[1,2,6].my_inject(0) {|sum, x| sum + x}
puts "multiply_els method test"
multiply_els([2,4,5])

subtract = Proc.new { |x| x - 7 }
puts "my_map proc test"
[1,2,6].my_map subtract
[1,2,6].my_map {|x| x**x}   