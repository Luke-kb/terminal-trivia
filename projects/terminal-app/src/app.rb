require 'httparty'
require 'tty-prompt'

class Question
  attr_reader :category, :difficulty, :question, :correct_answer, :incorrect_answers

  def initialize

    @url = "https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple"
    response = HTTParty.get(@url)

    #assign returned results to variable
    question_bank = response.parsed_response

    # print all values for reference
    # p question_bank

    # assign variables to keys in results
    @category = question_bank["results"][0]["category"]
    # p @category

    @difficulty = question_bank["results"][0]["difficulty"]
    # p @difficulty

    @question = question_bank["results"][0]["question"]
    # p @question

    @correct_answer = question_bank["results"][0]["correct_answer"]
    # p @correct_answer

    @incorrect_answers = question_bank["results"][0]["incorrect_answers"]
    # p @incorrect_answers

  end

end

question1 = Question.new
# p question1.question


prompt = TTY::Prompt.new
#sets up Q and shuffles the order of the answer options
user_answer1 = prompt.select("#{question1.question}", question1.incorrect_answers.push(question1.correct_answer).shuffle)

if user_answer1 == question1.correct_answer
  puts "Nice!"
else
  puts "incorrect"
end


# prompt.keypress("Press any key  to continue")



