
def stockpicker(prices)

#start with variables set to 0
	max_profit = 0
	best_sell_day = 0
	best_buy_day = 0
	this_profit = 0


#run through the array of prices comparing the 1st to 2nd,3rd,4th etc then comparing 2nd to 3rd, 4th, 5th, etc.

  prices.each_with_index do  |x, i|
  	y = i +1
  		while y < prices.length
  			this_profit = prices[y] - x      

  			if this_profit > max_profit     #if this profit is bigger than what's stored in max profit(which starts at zero)	
  				max_profit = this_profit			#this gets updated and bestbuyday and sellday are stored
  				
  				best_buy_day = i
  					
  				best_sell_day = y


  			end	

  	  	y = y + 1

  	 end 
	  

 end 	
 if max_profit == 0
 	puts "There was never a good time to buy the market was always falling"

 else

 puts "You would have made the most profit if you had bought on day #{best_buy_day + 1} and sold on day #{best_sell_day + 1}."
 
 end
end



#function to get the array from  the user.
def getprice      
	user_prices = []
	input = 0
	puts "Give me the stock prices one at a time then input \"end\" when you are finished"
		while input != "end"
		input = gets.chomp
			if	input.to_s != input.to_i.to_s
			puts "Please enter a number or input 'end'."
		else
			user_prices<<input.to_i	
			
	end
end	
return user_prices
end


#call function to get prices array to put in stockpicker method.
prices = getprice

stockpicker(prices)
stockpicker([3,4,5,6,11,23,56,2,1,645,1,3])

