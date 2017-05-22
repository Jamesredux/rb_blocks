def bubble_sort(array)
=begin
	array go through
		each element compare with element on right - if left > right swap
			then do next element -
				#if after a run through no elements were swapped then the array is in order.
				next run through - don't have to check last element but do the same as before
				keep running through until array is sorted.
=end
	sorted = false
	 #until sorted
	 	array.each_with_index do |x, i|
	 		next_ell = i + 1
	 		
	 		if x > array[next_ell]
	 			puts "yes"

	 			puts array
	 		else 
	 		 sorted = true	
	 		end #if

	 	end	 #each-do
	 #end  #until
end #whole method

#def bubble_sort_by
#	2nd problem
#end

bubble_sort([2,1])


#problem at the moment is it goes to last element of array and looks for something to the right - gets nil 
#can't compare a number to nil so gives error --