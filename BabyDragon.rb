class BabyDragon
  attr_accessor :name, :gender, :happiness_level, :weight

  def initialize(name, gender)
    @name = name
    @gender = gender
    @happiness_level = 'calm'
    @weight = 50
  end

  def do_something()
    puts "What do you want to do?"
    string = gets.chomp

    if string == "Feed"
      puts "How much do you want to feed him?"
      food = gets.chomp
      feed_dragon(food)


    elsif string == "Walk"
      puts "How much do you want to walk him?"
      distance = gets.chomp
      walk_dragon(distance)

    else
      puts "Didn't understand you."
      do_something()

    end

  end

  private
  def walk_dragon(distance)
    if distance.to_i > 10
      puts "#{name} is NOT happy. You walked him too far!"
    elsif distance.to_i <= 10
    puts "#{name} is happy. He's hungry now though."
    puts "How much do you want to feed him?"
    food = gets.chomp
    feed_dragon(food)
    end

  end

  def feed_dragon(quantity)
    if quantity.to_i < 15
      puts "#{name} is pissed. He wanted more food. He eats you."
    else
      puts "#{name} is content. You fed him well."
    end

  end

end
