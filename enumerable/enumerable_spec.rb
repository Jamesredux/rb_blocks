require './enumerable.rb'


RSpec.describe Enumerable do
	let(:array) {[1,2,3,4]}
	let(:zeroarray) {[0,0,0,0]}
	let(:nilarray) { [] }
	let(:bigarray) {[1,2,3,4,5,6,7,8]}
	let(:stringarray) {['one','two','three']}



	describe ':my_each' do 
			
		it 'iterates simply through array' do 
			newarr = []
			array.my_each do |x|
				newarr<<x 
			end
				expect(newarr).to eql([1,2,3,4])
		end

		it 'can be used to alter elements in array' do
			newarr = []
			array.my_each do |x|
					x = x + 2
					newarr<<x 
			end
				expect(newarr).to eql([3,4,5,6])
		end

	describe ':my_any?' do

		context 'testing numeric values' do 
			it 'identifies values in array' do 
				expect(array.my_any? { |x| x <= 4 }).to eql true
			end

			it 'identifies the absence of values' do 
				expect(array.my_any? { |x| x > 7 }).to eql false
			end

			it 'does not raise an error with an empty array' do 
				expect(nilarray.my_any? { |x| x == 0 }).to eql false
			end

			it 'finds single value with ==' do 
				expect(array.my_any? { |x| x == 2  }).to be true
			end
		end
	end

	describe ':my_select' do 
		
		it "selects all even numbers in an array" do
			expect(bigarray.my_select { |x| x%2 == 0 }).to eql([2,4,6,8])
		end
		
		it "doesn't select when there are no matching values" do
				expect(array.my_select { |x| x%7 == 0 }).to eql([])
		end

		it "selects not numeric" do
			expect(stringarray.my_select { |x| x.length > 3 }).to eql(['three'])
		end
	end

	describe 'my_map' do 
	
		context 'my_map returns an altered array' do
			it 'square each element in an array' do 
				expect(array.my_map { |num| num ** 2}).to eq([1,4,9,16])
			end

			it 'alters string array' do 
				expect(stringarray.my_map { |word| 'we ' + word }).to eql(['we one','we two','we three'])
			end	
		end
	end

	describe 'my_count' do

		it 'counts instances of values in array' do 
			expect(array.my_count(3)).to eq(1)
		end

		it 'counts instances when taking a block' do 
			expect(array.my_count{ |x| x%2 == 0 }).to eq(2)
		end

		it 'counts string instances when taking a block' do 
			expect(stringarray.my_count('two')).to eq(1)
		end

		it 'counts the size of array when no argument given' do 
			expect(stringarray.my_count).to eql(3)
		end
	end

	describe 'multiply_els' do 

		it 'multiplys all the elements in an array together' do 
			expect(multiply_els(array)).to eq(24)
		end

		it 'multiplys all the elements in an array together that are zero' do 
			expect(multiply_els(zeroarray)).to eq(0)
		end

		it 'returns nil for an empty array' do 
			expect(multiply_els(nilarray)).to eq(nil)
		end
	end

	end	
end		 
