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
			deck << (x + "-" + y)
		end
	end
	return deck.shuffle
end

#give the cards a value with ACE exception (1 or 11 depending on value)

def card_values(array)
	array.inject({}) do |result, element|
		result[element] = 
			if element.to_s.include?("Ace")
				1
			elsif element.to_s.include?("2")
				2
			elsif element.to_s.include?("3")
				3
			elsif element.to_s.include?("4")
				4
			elsif element.to_s.include?("5")
				5
			elsif element.to_s.include?("6")
				6
			elsif element.to_s.include?("7")
				7
			elsif element.to_s.include?("8")
				8
			elsif element.to_s.include?("9")
				9
			else #10 jack queen and king are all equal to 10
				10
			end
		result
	end
end

def evaluate_cards(array)
	card_total = 0
	array.each do |x|
		card_total += @card_values_hash[x]
	end
	return card_total.to_i
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
@card_values_hash = card_values(deck_of_cards)

dealer_cards = deck_of_cards.pop(2)

puts "The Dealer has #{dealer_cards} for a total of #{evaluate_cards(dealer_cards)}"

player_cards = deck_of_cards.pop(2)

puts "You have #{player_cards} for a total of #{evaluate_cards(player_cards)}"

puts "Hit or Stay?"
response = gets.chomp.capitalize

case response
when "Hit"
	player_cards = player_cards.concat(deck_of_cards.pop(1))
	binding.pry
	puts "You have #{player_cards} for a total of #{evaluate_cards(player_cards)}"
when "Stay"
	puts player_cards
else
	player_cards
end



#binding.pry


#deal the dealer

#deal the player

#Evaluate the winner
