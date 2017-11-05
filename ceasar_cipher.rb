 def encrypt(text, shift)
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
     	end  #ends if/else
   end   #ends iteration
     code = code.join 
   puts code	
  end   #ends function




puts "What would you like encrypted mate?"
message = gets.chomp


def getkey       #function to get shift amount and check it is a number
	puts "And what is the cypher key?"
		input = gets.chomp
		while	input.to_s != input.to_i.to_s
		puts "Please enter a number"
		input = gets.chomp	
			
	end
return input.to_i
end


key = getkey

encrypt(message, key)