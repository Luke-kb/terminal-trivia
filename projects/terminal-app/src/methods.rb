#clears the terminal
def clear
system 'clear'
end

#print text slowly
def slow(words, time)
  words.each_char { |char| 
      print char
      sleep(time)
      }
  print "\n"
end

#welcome message before main menu
def welcome
  clear
  slow("welcome to", 0.1)
  sleep 1
  print "\n"
  slow(".\n.\n.", 0.5)
  print "\n"
  sleep 0.5
  title = Artii::Base.new
  puts title.asciify('Terminal Trivia !')
end

#press any key to continue prompt
def any_key
  any_key = TTY::Prompt.new
  any_key.keypress("press any key to continue..")
end

#username input 
def check_username
  prompt = TTY::Prompt.new
  prompt.ask('Please enter your username:')

  end
end

