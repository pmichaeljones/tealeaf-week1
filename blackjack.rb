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

puts ">>What is your name?"
player_name = gets.chomp

puts "Welcome, #{name}. Let the games begin!"

#numbers of cards
card_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "Jack", "Queen", "King"]

#suits of cards
suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

#create a deck of cards
deck_of_cards = {

}

#deal the dealer

#deal the player

#Evaluate the winner
