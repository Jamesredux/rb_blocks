require "./ceasar_cipher.rb"

RSpec.describe "ceasar cipher" do

	context 'testing encrypt method' do
		it 'works with all lower case' do 
			expect(CeasarCipher.encrypt('abcd', 2)).to eq('cdef')
		end

		it 'works will all uppercase' do 
			expect(CeasarCipher::encrypt('JKLMN', 7)).to eq('QRSTU')
		end

		it 'works with upper and lower case' do 
			expect(CeasarCipher::encrypt('HaPPy BiRThday', 8)).to eq('PiXXg JqZBplig')
		end

		it 'handles end of alphabet correctly' do 
			expect(CeasarCipher::encrypt('wxyz', 5)).to eq('bcde')
		end

		it 'can handle non-alpha characters' do 
			expect(CeasarCipher::encrypt('1 test!@#$%', 4)).to eq('1 xiwx!@#$%')
		end

		it 'returns same message when shift is 0' do 
			expect(CeasarCipher::encrypt('No change', 0)).to eq('No change')
		end

		it 'does not break with empty string' do 
			expect(CeasarCipher::encrypt('', 16)).to eq('')
		end

	end
end

#also check the getinput method

RSpec.describe 'ceasar cipher get input method' do
	#it asks user for input
	#it asks user for number
	#it checks number is correct
	#it correctly encrypts code

end	
