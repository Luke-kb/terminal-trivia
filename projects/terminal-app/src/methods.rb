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

#prints title graphic
def title
  title = Artii::Base.new
  puts title.asciify('Terminal Trivia !')
end

#welcome message before main menu
def welcome
  clear
  slow("welcome to", 0.2)
  sleep 1
  print "\n"
  # slow(". . .", 0.2)
  clear
  title
end

#press any key to continue prompt
def any_key(message)
  prompt = TTY::Prompt.new
  prompt.keypress(message)
end

#username input & validation
def check_username
  
  loop = true

  while loop
    prompt = TTY::Prompt.new
    user_input = prompt.ask('Please enter your username (letters only): ') do |q|
      q.required true
      q.validate /[a-zA-Z]/    #letters only
      q.modify :remove, :capitalize    #remove whitespace & capitalize
    end

    print @cursor.clear_lines(2, :up)
    puts "Welcome #{user_input.colorize(:cyan)}!"
    puts "\n"
    
    choices = %w(yes no exit)
    confirm = prompt.select('Is this username correct?', choices)

    case confirm
    when "yes"
      @username = user_input
      loop = false
    when "no"
      print @cursor.clear_lines(4, :up)
    when "exit"
      exit_app
      loop = false
    end
  end
end

def exit_app
  clear
  puts "BYE."
  sleep 2
  exit    #find out how to close terminal window
end


#give user the score
def get_score
  clear
  puts "you scored #{@score} out of 5!"
end


def quiz_loop

  #ask up to 5 questions
  while @question_index < 5
    ask_question(@question_index)
    @question_index += 1
    #add method to insert faker comment?
  end

  any_key("Nice!\nPress any key to view your score!") 

end


def ask_question(num)
  
  #create tty-prompt instance
  prompt = TTY::Prompt.new
  
  #ask the question
  user_answer = prompt.select("#{@questions.prompts[@question_index]}", @questions.incorrect_answers[@question_index].push(@questions.correct_answers[@question_index]).shuffle)

  #keep score
  if user_answer = @questions.correct_answers[@question_index]
    @score += 1
    #insert faker comment?
    print @cursor.clear_lines(3, :up)
    print @cursor.down(1)
    any_key("hit #{"spacebar".colorize(:green)} to continue..")
    print @cursor.clear_lines(2, :up)
  else 
    #insert faker comment?
    print @cursor.clear_lines(3, :up)
    print @cursor.down(1)
    any_key("hit #{"spacebar".colorize(:green)} to continue..")
    print @cursor.clear_lines(2, :up)
  end

end
