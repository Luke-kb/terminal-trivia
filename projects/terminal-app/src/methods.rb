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
  slow("welcome to", 0.1)
  sleep 1
  print "\n"
  slow(".\n.\n.", 0.5)
  print "\n"
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
  slow("Are you ready for some questions?\n", 0.08)
  sleep 1
  any_key("press any key to continue..")
  
  #clear screen
  clear

  # add spinning wheel?
  
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

def get_score
  clear
  puts "you scored #{@score} out of 5!"

end






# def validate_answer(number)
#   if user_answer == questions.correct_answer
#     @score =+ 1
#     next_question
#     p @score
#   else
#     puts "Feeling lucky?"
#     sleep 2
#     next_question
#   end
# end
