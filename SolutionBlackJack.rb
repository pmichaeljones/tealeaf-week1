def calculate_total(cards) # [["Hearts", "3"], ["Clubs", "10"].....]
  arr = cards.map{|e| e[1] }

  total = 0

  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 #jack, queen, king
      total += 10
    elsif
      total += value.to_i
    end
  end

  arr.select{|e| e == "A"}.count.times do
    if total > 21
      total -= 10
    end
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

puts "You have: #{mycards[0]} and #{mycards[1]}"

puts "Do you want to HIT or STAY?"

hit_or_stay = gets.chomp

