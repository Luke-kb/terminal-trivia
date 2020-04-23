# require_relative './app.rb'
# require_relative './QuizGame.rb'
require_relative './QuestionBank.rb'

class Question < QuestionBank

  def initialize
    super
  
  end

  def ask
end


# quiz = QuestionBank.new
# puts quiz.question_bank
puts quiz.q_prompt1
puts quiz.q_prompt2
puts quiz.q_prompt3
puts quiz.q_prompt4
puts quiz.q_prompt5
puts "---------------"
puts quiz.correct_answer1
puts quiz.correct_answer2
puts quiz.correct_answer3
puts quiz.correct_answer4
puts quiz.correct_answer5









