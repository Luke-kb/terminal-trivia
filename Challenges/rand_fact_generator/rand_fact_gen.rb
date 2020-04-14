# In your program:
#     Create a loop/method that will greet the user and ask if they want a fun fact
#     Use faker (or the gem of your choice) to display the fact, then ask the user if they would like another fact
#     If they want another fact, give them another one, else exit the app with a farewell message

# Extra Challenge: 
# Include another gem, such as colorize, to make your app super cool!!

require 'faker'
require 'colorize'

def gen_fact
  system "clear"
  puts Faker::ChuckNorris.fact
  sleep(2)
  greeting2  
  fun_fact_gen
end

def greeting1
  system "clear"
  print "Hello."
  sleep(1)
  print "."
  sleep(1)
  print ".\n"
  print "Would you like to learn a fun fact? (y/n)"
end

def greeting2
  puts "would you like to learn another? (y/n)"
end

def fun_fact_gen
  # system "clear"
  # puts "Hello."
  loop do
  input = gets.strip.downcase

  if input == "y"
    gen_fact
    # puts "run fact gen method"
    break
  elsif input == "n"
    puts "goodbye"
    break  
  end
   puts "Please try again..."
   puts "Would you like to learn a fun fact? (y/n)"
  end
end

greeting1
fun_fact_gen