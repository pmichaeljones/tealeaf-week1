# How the game will work

# 1. Ask the players name and save to variable
# 2. Deal the dealer two cards and display them. Save sum
# 3. Deal the player two cards and display them. Save sum
# 4. Ask player if they want to hit or stay (this is a loop)
# 5. Once player is done, RETURN out of loop and move to dealer's turn
# 6. Dealer IS NOT asked to hit or stay. They have set rules for hit & stay
# 7. Once dealer's card are determined, run evaluation method to find winner.
# 8. Ask player if they want to play again
# 9. If YES, start over, if no EXIT.
# 10. Figure out except for ACES

require 'pry'

#create a deck of cards
def build_deck(numbers, suites, deck = [])
	#binding.pry
	numbers.each do |x|
		suites.each  do |y|
			deck << (x + "-" + y)#.to_sym
		end
	end
	return deck
end

#give the cards a value with ACE exception (1 or 11 depending on value)

def card_values(array)
	array.inject({}) do |result, element|
		result[element] = 
			if element.include?("Ace")
				1
			elsif element.include?("2")
				2
			elsif element.include?("3")
				3
			elsif element.include?("4")
				4
			elsif element.include?("5")
				5
			elsif element.include?("6")
				6
			elsif element.include?("7")
				7
			elsif element.include?("8")
				8
			elsif element.include?("9")
				9
			else #10 jack queen and king are all equal to 10
				10
			end
		result
	end
end

puts ">>What is your name?"
player_name = gets.chomp

puts "Welcome, #{player_name}. Let the games begin!"

#numbers of cards
card_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

#suits of cards
suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

#instantiate the deck of cards array
deck_of_cards = build_deck(card_names, suits)

#input the deck of cards into the value method to get card values
card_values_hash = card_values(deck_of_cards)

puts deck_of_cards

puts card_values_hash

#binding.pry


#deal the dealer

#deal the player

#Evaluate the winner
