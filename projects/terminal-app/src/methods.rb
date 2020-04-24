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
  slow("welcome\n\nto", 0.2)
  sleep 1
  print "\n"
  slow(". . .", 0.2)
  clear
  title
end

#press any key to continue prompt
def any_key(message)
  prompt = TTY::Prompt.new
  prompt.keypress(message)
end

#username input 
def check_username
  prompt = TTY::Prompt.new
  user_input = prompt.ask('Please enter your username (letters only): ') do |q|
    q.validate /[a-zA-Z]/
  end
  clear
  title
  puts "Welcome #{user_input}!"
  @username = user_input
end

def quiz

  #create QuestionBank instance and grab question data
  questions = QuestionBank.new
  
  # are you ready prompt
  slow("Are you ready to begin?\n", 0.08)
  sleep 1
  any_key("press any key to continue..")
  
  #clear screen
  clear
  
  #print Question 1
  prompt = TTY::Prompt.new
  user_answer = prompt.select("#{questions.q_prompt1}", questions.incorrect_answers1.push(questions.correct_answer1).shuffle)
  
  #validate Question 1
  if user_answer == questions.correct_answer1
    @score =+ 1
    any_key("Press spacebar to continue.")
  else
    puts "Feeling lucky?"
    sleep 2
    any_key("Press spacebar to continue.")
  end
  
  #print Question 2
  clear
  user_answer = prompt.select("#{questions.q_prompt2}", questions.incorrect_answers2.push(questions.correct_answer2).shuffle)

  #validate Question 2
  if user_answer == questions.correct_answer2
    @score =+ 1
    any_key("Press spacebar to continue.")
  else
    puts "Feeling lucky?"
    sleep 2
    any_key("Press spacebar to continue.")
  end
  
  #print Question 3
  clear
  user_answer = prompt.select("#{questions.q_prompt3}", questions.incorrect_answers3.push(questions.correct_answer3).shuffle)

  #validate Question 3
  if user_answer == questions.correct_answer3
    @score =+ 1
    any_key("Press spacebar to continue.")
  else
    puts "Feeling lucky?"
    sleep 2
    any_key("Press spacebar to continue.")
  end

  #print Question 4
  clear
  user_answer = prompt.select("#{questions.q_prompt4}", questions.incorrect_answers4.push(questions.correct_answer4).shuffle)

  #validate Question 4
  if user_answer == questions.correct_answer4 
    @score =+ 1
    any_key("Press spacebar to continue.")
  else
    puts "Feeling lucky?"
    sleep 2
    any_key("Press spacebar to continue.")
  end

  #print Question 5
  clear
  user_answer = prompt.select("#{questions.q_prompt5}", questions.incorrect_answers5.push(questions.correct_answer5).shuffle)

  #validate Question 5
  if user_answer == questions.correct_answer5
    @score =+ 1
    any_key("Press spacebar to view your score!")
  else
    puts "Feeling lucky?"
    sleep 2
    any_key("Press spacebar to view your score!")
  end
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
    #add method to insert faker comment?
    @question_index += 1

  end

  any_key("Nice! Press any key to view your score!") 

end


def ask_question(num)
  
  #create tty-prompt instance
  prompt = TTY::Prompt.new(active_color: :cyan)
  
  #ask the question
  user_answer = prompt.select("#{@questions.prompts[@question_index]}", @questions.incorrect_answers[@question_index].push(@questions.correct_answers[@question_index]).shuffle.shuffle)

  #keep score
  if user_answer = @questions.correct_answers[@question_index]
    @score += 1
    #insert faker comment?
    any_key("hit #{"spacebar".colorize(:green)} to continue..")
  else 
    #insert faker comment?
    any_key("hit #{"spacebar".colorize(:green)} to continue..")
  end

end
