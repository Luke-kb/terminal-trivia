require 'httparty'
require 'htmlentities'

class QuestionBank
  attr_reader :prompts, :correct_answers, :incorrect_answers, :q_amount, :url
  attr_accessor :q_index

  def initialize(url = nil)

    @url = url
    url = "https://opentdb.com/api.php?amount=5&difficulty=easy&type=multiple"
    response = HTTParty.get(url)
    
    #create instance array of question prompts
    @prompts = 
      response.parsed_response["results"].map { 
        |index| index["question"] }
          
    #create instance array of correct answers
    @correct_answers = response.parsed_response["results"].map { 
      |index| index["correct_answer"] }
          
    #create instance array of incorrect answers
    @incorrect_answers = response.parsed_response["results"].map { 
      |index| index["incorrect_answers"] }
            
      @q_amount = @prompts.length
      @q_index = 0

    #remove HTMLEntities
    coder = HTMLEntities.new
    
    @prompts = @prompts.map {|item| coder.decode(item)}
    @correct_answers = @correct_answers.map {|item| coder.decode(item)}
    @incorrect_answers = @incorrect_answers.map {|row| row.map {|item| coder.decode(item)}} 

  end

end
