require 'httparty'

class QuestionBank
  attr_reader :correct_answer1, :correct_answer2, :correct_answer3, :correct_answer4, :correct_answer5,
   :incorrect_answers1, :incorrect_answers2, :incorrect_answers3, :incorrect_answers4, :incorrect_answers5,
   :q_prompt1, :q_prompt2, :q_prompt3, :q_prompt4, :q_prompt5

  def initialize
    
    url = "https://opentdb.com/api.php?amount=5&category=22&difficulty=easy&type=multiple"
    response = HTTParty.get(url)

    #assign returned results to @question_bank variable
    question_bank = response.parsed_response

    #create instance variables for each question object
    # @question1 = question_bank["results"][0]
    # @question2 = question_bank["results"][1]
    # @question3 = question_bank["results"][2]
    # @question4 = question_bank["results"][3]
    # @question5 = question_bank["results"][4]

    #create instance variables for each question prompt
    @q_prompt1 = question_bank["results"][0]["question"]
    @q_prompt2 = question_bank["results"][1]["question"]
    @q_prompt3 = question_bank["results"][2]["question"]
    @q_prompt4 = question_bank["results"][3]["question"]
    @q_prompt5 = question_bank["results"][4]["question"]
    
    # #create instance variables for each correct answer
    @correct_answer1 = question_bank["results"][0]["correct_answer"]
    @correct_answer2 = question_bank["results"][1]["correct_answer"]
    @correct_answer3 = question_bank["results"][2]["correct_answer"]
    @correct_answer4 = question_bank["results"][3]["correct_answer"]
    @correct_answer5 = question_bank["results"][4]["correct_answer"]
    
    # #create instance variables for incorrect answers
    @incorrect_answers1 = question_bank["results"][0]["incorrect_answers"]
    @incorrect_answers2 = question_bank["results"][1]["incorrect_answers"]
    @incorrect_answers3 = question_bank["results"][2]["incorrect_answers"]
    @incorrect_answers4 = question_bank["results"][3]["incorrect_answers"]
    @incorrect_answers5 = question_bank["results"][4]["incorrect_answers"]

  end

end
