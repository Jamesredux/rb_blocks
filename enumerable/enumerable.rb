

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
	 	selected
	end

	def my_all?
		all_pass = true
		self.my_each do |i|
			if yield(i) == false
					all_pass = false
			end
			
		end	
		 all_pass
	end


 def my_any?
 	 any_true = false
 	 	self.my_each do  |i|
 	 		if yield(i) == true
 	 			any_true = true
 	 		end
 	 	end
 		any_true
 	 end

 	def my_none?
 		none_true = true
 			self.my_each do |i|
 				if yield(i) == true
 					none_true = false
 				end
 			end
				return none_true
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

 			count 
 	end	

 	def my_map
 		map_return = []
 			self.my_each do  |i|
 				map_return<<(yield(i))
 			end	
 			 map_return
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
 		 map_return

 	end


 	def my_inject(arg =nil)  
 		
		total = arg.nil? ? first : arg		
 		my_each { |i| total = yield(total, i)}    #not sure why my solution wasn't
 																								#working had to copy someone else
 																								#has problems with 1st element
 		total
 	end	
end

def multiply_els(array)
 		array.my_inject { |arg,x| arg * x }  

end	


