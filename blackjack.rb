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

#numbers of cards
card_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

#suits of cards
suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

#create a deck of cards
def build_deck(numbers, suites, deck = [])
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
				11
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

def hit_or_stay()
	puts "Hit or Stay?"
		response = gets.chomp.capitalize
	case response
		when "Hit"
			@player_cards = @player_cards.concat(@deck_of_cards.pop(1))
			puts "You have #{@player_cards} for a total of #{evaluate_cards(@player_cards)}."
			hit_or_stay()
		when "Stay"
			puts "Your stayed with #{@player_cards} for a total of #{evaluate_cards(@player_cards)}."
			puts "Now the dealer's turn."
			puts "---------"
			dealers_turn(@dealers_cards)
		else
			puts "I don't understand."
			hit_or_stay()
	end

end

def dealers_turn(dealers_cards)
	@dealers_score = evaluate_cards(dealers_cards)

	puts "The Dealer flips his cards and has #{@dealers_cards}."

	if @dealers_score >= 17 #dealer has 17 or higher, she stays
		puts "The dealer's hand is 17 or above and must stay. Let's see who wins."
		puts "-----"
		decide_winner(@player_cards, @dealers_final_cards)

	elsif @dealers_score < 17
		puts "The dealer's hand is less than 17 and must hit."
		@dealers_final_cards = dealers_cards.concat(@deck_of_cards.pop(1))
		dealers_turn(@dealers_final_cards)
	end
	
	end

def decide_winner(player_cards, dealers_final_cards)

end



puts ">>What is your name?"
player_name = gets.chomp

puts "Welcome, #{player_name}. Let the games begin!"
puts "------------------"


#instantiate the deck of cards array
@deck_of_cards = build_deck(card_names, suits)

#input the deck of cards into the value method to get card values
@card_values_hash = card_values(@deck_of_cards)

@dealers_cards  = @deck_of_cards.pop(1)

@player_cards  = @deck_of_cards.pop(1)

@dealers_cards  = @dealers_cards.concat(@deck_of_cards.pop(1))

@player_cards = @player_cards.concat(@deck_of_cards.pop(1))

puts "The Dealer has \"#{@dealers_cards[0]}\" and a face down card."

puts "You have #{@player_cards} for a total of #{evaluate_cards(@player_cards)}."

hit_or_stay()


#nothing
#again

#binding.pry


#deal the dealer

#deal the player

#Evaluate the winner
