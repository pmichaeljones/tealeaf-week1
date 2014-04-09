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
   

def start_game(player_name = '')
  #numbers of cards
  card_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

  #suits of cards
  suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
	
  if player_name.empty? 
	puts ">>What is your name?"
	@player_name = gets.chomp
	puts "Welcome, #{@player_name}. Let the games begin!"
  else
	puts "Hi, #{player_name}. Welcome back."
  end


  puts "------------------"


  #instantiate the deck of cards array
  @deck_of_cards = build_deck(card_names, suits)

  #input the deck of cards into the value method to get card values
  @card_values_hash = card_values(@deck_of_cards)

  #true card dealing is one card for each player at a time, not two at once. Hence the back and forth.


  @dealers_cards  = @deck_of_cards.pop(1)

  @player_cards  = @deck_of_cards.pop(1)

  @dealers_cards  = @dealers_cards.concat(@deck_of_cards.pop(1))

  @player_cards = @player_cards.concat(@deck_of_cards.pop(1))

  puts "The Dealer has \"#{@dealers_cards[0]}\" and a face down card."

  puts "You have #{@player_cards} for a total of #{evaluate_cards(@player_cards)}."

  hit_or_stay()
end


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

#pass the array of cards into the values hash to get a value for how much each card is worth

def evaluate_cards(array, card_total = 0)
  @grand_total = card_total
  array.each do |x|
	@grand_total += @card_values_hash[x]
  end

  # Not the happiest with this logic. Needed to deal with players hitting when they have double aces and making them 2 instead of 22

  if (array.include?("Ace-Spades") || array.include?("Ace-Hearts") || array.include?("Ace-Diamonds") || array.include?("Ace-Clubs")) && @grand_total > 21 && @grand_total <= 31
	@grand_total -= 10
	return @grand_total.to_i
  
  elsif (array.include?("Ace-Spades") || array.include?("Ace-Hearts") || array.include?("Ace-Diamonds") || array.include?("Ace-Clubs")) && @grand_total > 32 && @grand_total <= 42
	@grand_total -= 20
	return @grand_total.to_i
  
  elsif (array.include?("Ace-Spades") || array.include?("Ace-Hearts") || array.include?("Ace-Diamonds") || array.include?("Ace-Clubs")) && @grand_total == 43
	@grand_total -= 30
	return @grand_total.to_i
  else
	return @grand_total.to_i
  end

end

#Player gets choice if they want to keep their current cards or get another (hit)

def hit_or_stay()
	puts "Hit or Stay?"
		response = gets.chomp.capitalize
	case response
		when "Hit"
			@player_cards = @player_cards.concat(@deck_of_cards.pop(1))
			@players_score = evaluate_cards(@player_cards)
			puts "You have #{@player_cards} for a total of #{@players_score}."
			check_bust(@players_score)
			hit_or_stay()
		when "Stay"
			@players_score = evaluate_cards(@player_cards)
			puts "Your stayed with #{@player_cards} for a total of #{@players_score}."
			puts "Now the dealer's turn."
			puts "---------"
			dealers_turn(@dealers_cards)
		else
			puts "I don't understand."
			hit_or_stay()
	end

end

#Dealer's turn. Needs to hit on 16s and stay on 17s and up

def dealers_turn(dealers_cards)
	@dealers_score = evaluate_cards(dealers_cards)

	puts "The Dealer flips his card and has #{dealers_cards} for #{@dealers_score}."

	if @dealers_score >= 17 #dealer has 17 or higher, she stays
		@dealers_final_cards = dealers_cards
		dealer_bust(@dealers_score)
		puts "The dealer's hand is 17 or above and must stay. Let's see who wins."
		puts "-----"
		decide_winner(@players_score, @dealers_score)

	elsif @dealers_score < 17
		puts "The dealer's hand is less than 17 and must hit."
		@dealers_final_cards = dealers_cards.concat(@deck_of_cards.pop(1))
		dealers_turn(@dealers_final_cards)
	end
	
end

#compare the player's score to the dealer's score

def decide_winner(player_score, dealer_score) 
	if player_score > dealer_score && player_score <= 21
		puts "Your score of #{player_score} beats the dealers #{dealer_score}. You win!"
		play_again()

	elsif player_score < dealer_score && dealer_score <= 21
		puts "The dealer's #{dealer_score} beats your #{player_score}. Dealer Wins."
		play_again()

	elsif player_score == dealer_score
		puts "You both have a score of #{player_score}. That's a Push!"
		play_again()
	else
		puts "How did you get here? I thought I had it all worked out????"
	end

end

#check to see if the player busts after each hit

def check_bust(score) 
	if score > 21
		puts "Sorry buddy, you busted."
		play_again()
	else
		nil
	end

end

#check to see if the dealer busts after each hit

def dealer_bust(score) 
	if score > 21
		puts "Dealer busted. You win!"
		play_again()
	else
		nil
	end

end

#good way to DRY up my code. Call this method after every game ends.

def play_again 
	puts "Play again? Type Yes or No"
	response = gets.chomp.capitalize
		if response == "Yes"
			start_game(@player_name)
		elsif response == "No"
			puts "Thanks for playing."
			Process.exit()
		else
			puts "Does '#{response}' look like 'Yes' or 'No' to you? Do you know how to type?"
			play_again()
		end
end

  

start_game()
