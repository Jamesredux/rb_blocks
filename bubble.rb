def bubble_sort(array)

sorted = false
check_it = array.length - 1    #total number of pairs to compare on 1st runthru
	until sorted
		inorder = true  #presumption that array in order
										#if this is still true at end of runthru then 
										#numbers are in order and we can end sort

		check_it.times do |i|
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]         #this swaps the 2 numbers if a > b
			
				inorder = false                                       #inorder changed to false as a swap was
																														#needed so we need another runthru to check		
		
			end
		
			puts array.inspect	#just to see sort working
		
			end               #end of runthru
	 		
	 		check_it -= 1      #change number of pairs to check as last element will be in right place
			puts "end of runthrough"

			if check_it == 0			#this means we have itterated completely so array must be in order
				sorted = true 
			elsif inorder == true  #if we did a runthru and nothing needed to be changed
				sorted = true		
		
			end
		
 	end
end 



bubble_sort([3,5,9,2,1])

 

#sorted is set to true when check it reaches 0 as the array MUST to in order by that point as 
#each pair has been gone through the maximum number of times 




def bubble_sort_by(array)

sorted = false
check_it = array.length - 1    
	until sorted
		inorder = true  
		check_it.times do |i|
			y =  yield(array[i], array[i+1])
			if y == 1
				array[i], array[i+1] = array[i+1], array[i]        
			
				inorder = false                                      																												
		
			end
		
			puts array.inspect	
			end              
	 		
	 		check_it -= 1      
			puts "end of yield runthrough"

			if check_it == 0			
				sorted = true 
			elsif inorder == true 
				sorted = true		
		
			end
		
 	end
end 


bubble_sort_by([3,5,15,1,7,9])  { |left, right| left <=> right }
bubble_sort_by([3,5,15,1,7,9])  { |left, right| right <=> left } 
bubble_sort_by(["this", "wonder", "if", "you"])  { |left, right| left.length <=> right.length }