

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



end



[4,6,2].my_each do |x|
	puts x
end

[6,7,9,3].my_each_with_index { |x, i| puts "the index is #{i} and the element is #{x}"}

def testee(array)
	billy = [5,5,5,5]
	array.my_each_with_index do |x, index|
			billy[index+1] = x
	end
	puts billy.inspect
	end

	testee([6,8,3,2])		