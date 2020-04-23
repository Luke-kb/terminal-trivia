require 'tty-prompt'
require 'tty-cursor'
require 'artii'
require 'colorize'
require_relative './QuestionBank.rb'
require_relative './methods.rb'
require_relative './Score.rb'

welcome
any_key
check_username






# puts quiz.question_bank
# puts quiz.q_prompt1
# puts quiz.q_prompt2
# puts quiz.q_prompt3
# puts quiz.q_prompt4
# puts quiz.q_prompt5
# puts "---------------"
# puts quiz.correct_answer1
# puts quiz.correct_answer2
# puts quiz.correct_answer3
# puts quiz.correct_answer4
# puts quiz.correct_answer5

# def ask_questions
#   quiz = QuestionBank.new

#   loop do
#     #create tty prompt instance
#     prompt = TTY::Prompt.new
#     #add in Q data and shuffle the order of the answer options each time
#     user_answer = prompt.select("#{quiz.q_prompt1}", quiz.incorrect_answers1.push(quiz.correct_answer1).shuffle)
    
#     if user_answer == quiz.correct_answer1
#       puts @score =+ 1
#       prompt.keypress("Press any key to continue")
#     else
#       puts "damn"
#       prompt.keypress("Press any key to continue")
#     end
#   end
# end

# ask_questions


#TODO
# 1 need to find a way to keep score after each question (what kind of variable?)
# 2 need to create a quiz class that runs the whole app
# 3 fine-tune quiz loop 
# 4 give user option to enter their name (tty-prompt)
# 5 title graphic (ascii art? figlet/lolcat?)
# 6 scoreboard at end of quiz (Score class)


# quiz = QuestionBank.new

# quiz.each_key do |key, value|
#   puts "#{key} and the #{value}"
# end


# #create tty prompt instance
# prompt = TTY::Prompt.new
# #add in Q data and shuffle the order of the answer options each time
# user_answer = prompt.select("#{quiz.q_prompt1}", quiz.incorrect_answers1.push(quiz.correct_answer1).shuffle)
    


