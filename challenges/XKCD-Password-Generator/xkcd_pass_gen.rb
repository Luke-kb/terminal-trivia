# # XKCD Password Generator

# This terminal app should generate a nice, memorable password based on the logic shown in this webcomic: https://xkcd.com/936/

# So, our app must combine four random words to create passwords.

#     The user should be able to do this forever until they are happy with the generated password.
#     The password should contain capital letters on every word and a random number at the end of the password.
#     Use a method with a parameter in the solution.
#     See what else you can optimize in the code with methods as well.

# Extension twist: Let the user choose which of the four chosen words to re-generate.
# eg. if the password is “CorrectHorseBatteryStaple123” and the user enters “regenerate 4” - 
# then the password becomes “CorrectHorseBatteryFlag123”

require 'faker'
require 'colorize'

@pass = ""

def greeting
  system "clear"
  puts "Welcome to the XKCD Password Generator!"
  puts "Enter 'p' to generate a password.. "
end

def init_pass_loop
  user_input = gets.chomp.strip

  while user_input != "p"
    puts "Invalid input. Please press spacebar."
  end
  
  gen_fake_pass
  sec_pass_loop
end

def sec_pass_loop

  puts "Now you can choose to \n-generate a new password ('g')\n-modify your password ('m')\n-exit ('e')"
  user_input = gets.chomp.strip
  generate = false

  while !generate
    if user_input == "m"
      modify_pass
    elsif user_input == "g"
      gen_fake_pass
      sec_pass_loop
      generate = true
    elsif user_input == "e"
      puts "Goodbye."
      break
    else 
      puts "Invalid input!"
    end
    puts "Invalid input!"
  end
end
 

def gen_fake_pass
  system "clear"
  @pass = ["#{Faker::Color.color_name.capitalize}","#{Faker::Verb.ing_form.capitalize}","#{Faker::Vehicle.make.capitalize}","#{Faker::Creature::Animal.name.capitalize}","#{rand(1..20)}"]
  puts "Your new password is:\n#{@pass.join.colorize(:green)}"
end

def modify_pass
  puts "To modify the password, enter the word number you would like to change. (1, 2, 3 or 4)"
  user_input = gets.chomp.strip.to_i

  case user_input
  when 1
    regen_pass(1)
  when 2
    regen_pass(2)
  when 3
    regen_pass(3)
  when 4
    regen_pass(4)
  else
    puts "Invalid input!"
  end

end

def regen_pass(num)
  #splits camelCase string into array
  # @pass.split/(?=[A-Z])/

  if num == 1
    @pass[0] = "#{Faker::Color.color_name.capitalize}"
  elsif num == 2
    @pass[1] = "#{Faker::Verb.ing_form.capitalize}"
  elsif num == 3
    @pass[2] = "#{Faker::Vehicle.make.capitalize}"
  elsif num == 4
    @pass[3] = "#{Faker::Creature::Animal.name.capitalize}"
  else
    puts "invalid number!"
  end
  puts "Your new password is:\n#{@pass.join.colorize(:green)}"
  sec_pass_loop
end

#app method calls
greeting
init_pass_loop


# -----------------------------------------------------------
# @words = [
#   "correct", "horse", "battery", "staple", "turtle", 
#   "blue", "noisy", "hungry", "extra", "speedy", "coding", 
#   "website", "banana", "seal", "zebra", "flag"
# ]
# def gen_pass
#   pass_array = @words.sample(4)
#   @pass = pass_array.map(&:capitalize).join + "#{rand(1..20)}"
#   p @pass
# end