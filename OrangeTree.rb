class OrangeTree
  attr_accessor :height, :age

  def initialize()
    @orange_count = 0
    @height = 0 #these are inches
    @age = 0
  end

  def count_the_orange
  end

  def pick_an_orange
    @oranges = @oranges -= 1
  end

  def many_years_pass(years)
    years.times do
      one_year_passes
    end
  end


  def one_year_passes
    @oranges = 0
    @age =+ @age + 1

    unless @age > 10
      @oranges = 0
    else
      @oranges = @oranges + @age * (rand(4)+1)
    end

    growth = ((rand(3)+1) * rand(5))
    @height = @height + growth #these are inches

    if @height >= 12
      @height_feet = @height / 12
      @height_inches = @height % 12
    else
      @height_feet = 0
      @height_inches = @height
    end

    puts "Our orange tree is now #{age} years old, has #{@oranges} oranges and #{@height_feet} feet and #{@height_inches} inches tall."

    if growth == 0
      puts "No growth this year. Blame it on the drought."
    end

  end

  def tree_stats
    puts "The tree is currently #{height} inches tall, #{age} years old, and has #{count_the_orange} orange."
  end

end
