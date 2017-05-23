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
check_it = array.length - 1
until sorted
		needswap = 0  #so it is reset at the beginning of each run thru
	check_it.times do |i|
		if array[i] > array[i+1]
			array[i], array[i+1] = array[i+1], array[i]
			needswap = 1
		end
		
		puts array.inspect
		if needswap == 0
			sorted = true
			
		end
	end
	 check_it -= 1 
	if check_it == 0
		sorted = true
	end

 end
end #whole method



bubble_sort([35,1,2,3,4,5])

#this works but needs a break for when numbers are in the right order - no swaps 
#needswap is the break starts at 0 during run through if a swap is needed it is set to 1 -
# if no swaps are needed in a run then it will remain at 0 - this must mean that the array is sorted 
# so sorted is set to true 

#sorted is also set to true when check it reaches 0 as the array MUST to in order by that point as 
#each pair has been gone through the maximum number of times