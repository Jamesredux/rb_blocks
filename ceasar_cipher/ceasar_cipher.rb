class CeasarCipher

 def self.encrypt(text, shift)
 	 code = []  #create the array that  the code will be put in
   text = text.split('')  #turn string into array of characters

    #iterate through the characters "x" one character at a time
    text.each do |x|  
     x = x.ord #convert to ascii

     	if (95..122).include?(x) #lower case letters
     		x += shift
     			if x>122  #wraparound!
     				x -= 26
     			end
     		x = x.chr
     		code<<x
   		elsif (65..90).include?(x) #upper case letters
   		 	x += shift
   		 		if x > 90
   		 			x -= 26
   		 		end
   	 		x = x.chr
   	 		code <<x
   		else    #leave all other characters eg space/!!? as they are
   	 		x = x.chr
   	 		code<<x
     	end 
    end  
      code = code.join 
      return code	
    end  

    def self.getinput       #function to get message and shift number from user
      puts "What would you like encrypted mate?"
      message = gets.chomp
      puts "And what is the cypher key?"
      input = STDIN.gets.chomp
        while input.to_s != input.to_i.to_s
          puts "Please enter a number"
          input = STDIN.gets.chomp  
        end
         key = input.to_i
      CeasarCipher::encrypt(message, key)
    end
  end


#tests
#puts CeasarCipher::encrypt('abc', 3)

#puts CeasarCipher::getinput