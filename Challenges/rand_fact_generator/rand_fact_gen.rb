
require 'faker'
require 'colorize'

def dash_space(seconds)
  x = 0
  until x == seconds
  print "-   "
  sleep(1)
  x += 1
  end
end


def get_fact
  system "clear"
  puts fact = Faker::ChuckNorris.fact.colorize(:green)
  dash_space(5)
  puts "\nWould you like to read another? (y/n)" 
end

def greeting1
  system "clear"
  print "What is your name? "
  user_name = gets.strip 
  puts "Hello #{user_name}. \nWould you like to read a fun fact? (y/n) "
end

def fun_fact_gen
  
  fact = true
  # puts "want a fun fact? (y/n)"

  while fact  
    user_input = gets.strip.downcase

    if user_input == "y"
      get_fact
    elsif user_input == "n"
      fact = false
      puts "Goodbye."
      sleep(2)
      system "clear"
    else
      puts "Please try again."
    end  
  end

end

greeting1
fun_fact_gen



