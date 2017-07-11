# PHASE 2
def convert_to_int(str)
  Integer(str)
  rescue ArgumentError => e
    puts "Entered a string"
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError.new("Wrong fruit")
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)

  rescue StandardError => e
    if maybe_fruit == "coffee"
      puts "coffee is ok but give me fruit"
      retry
    end
    puts e.message
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    unless yrs_known > 4
      raise ArgumentError.new("Must be at least 5")
    end
    @fav_pastime = fav_pastime
    if name.empty? || fav_pastime.empty?
      raise ArgumentError.new("Enter name and pastime")
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
