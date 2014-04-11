def calculate_total(cards) # [["Hearts", "3"], ["Clubs", "10"].....]
  arr = cards.map{|e| e[1] }

  total = 0

  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0 #jack, queen, king
      total += 10
    elsif
      total += value.to_i
    end
  end

  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end


puts "Welcome to BlackJack"


suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

deck = []

deck = suits.product(cards)

deck.shuffle!

#deal cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

#total values for each hand
dealertotal = calculate_total(dealercards)

mytotal = calculate_total(mycards)


#show cards

puts "Dealer has: #{dealercards[0]} and a facedown card."

puts "You have: #{mycards[0]} and #{mycards[1]} for a total of #{mytotal}"

if mytotal == 21
  puts "Congrats. You hit blackjack!"
  exit
end

puts "Do you want to HIT or STAY?"

while mytotal < 21
  puts "What would you like to do? 1) Hit or 2) Stay"
  hit_or_stay = gets.chomp

  if !['1','2'].include?(hit_or_stay)
    puts "Error: You must enter 1 or 2"
    next
  end

  if hit_or_stay == '2'
    puts "You chose to stay."
    break
  end

  #hit
  if hit_or_stay == '1'
    new_card = deck.pop
    mycards << new_card
    puts "Dealing new cards to player: #{new_card}"
    mytotal = calculate_total(mycards)
    puts "Your total is now: #{mytotal}"

    if mytotal == 21
      puts "Congrats. You got Blackjack!"
      exit
    elsif mytotal > 21
      puts "Sorry, you busted."
      exit
    end
  end
end

#dealers turn

puts "Dealer shows his cards: #{dealercards[0]} and #{dealercards[1]} for a total of #{dealertotal}"

if dealertotal == 21
  puts "Dealer hit blackjack. You lose."
  exit
end

while dealertotal < 17
  new_card = deck.pop
  puts "Dealing new card for dealer...It's a #{new_card}"

  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Dealer hit blackjack. You lose!"
    exit
  elsif dealertotal > 21
    puts "Dealer busted, you win!"
    exit
  end
end

puts "The dealer has #{dealertotal} and must stay."

puts "Time to see who wins!"
puts

if dealertotal > mytotal
  puts "The dealer's ##{dealertotal} beats your #{mytotal}"
  puts "Dealer wins."
  exit
elsif dealertotal < mytotal
  puts "Your #{mytotal} beats the dealer's #{dealertotal}"
  puts "You win. Congrats!"
  exit
else
  puts "You both have #{dealertotal}"
  puts "It's a tie!"
  exit
end















