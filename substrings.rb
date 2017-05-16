
#this program checks a string and sees if it contains words in a dictionary. then it creates a hash that counts 
# the number of times that the word occurs. jmc 16/5/17


dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", 
	"it", "i", "low", "own", "part", "partner", "sit", "this", "that", 
	"these", "when", "show", "who", "in", "bin", "shit", "fuck", 
	"yes", "no", "none"] 

wordzz = ["this",  "that"] #second dictionary to test that you can change the dictionary.

	def substring(text, dictionary)
			frequencies = Hash.new(0)	
			text.downcase!    
			word = text.split(/\W+/)  #splits string to array at non-alphanumeric characters removing !! ?? etc
				word.each do |word |    #iterate through the string.
					dictionary.each do |d|   #within this iteration, iterate through the dictionary checking the word in the dictionary
																		#against the word in the string 
						if	word.include? d
					#if dictionary.include? word
						frequencies[d] += 1
						end
						
					end
				
					
				end
				puts frequencies
						

			#	print out frequencies hash 
	end	



#testing the method..

	substring("Howdy partner, sit down, how's it going", dictionary)
	substring("below", dictionary)
	substring("innohow that is not a word but how much is picked up?", dictionary)
	substring("this that and the other", wordzz)