require 'httparty'
require 'htmlentities'

class QuestionBank
  attr_reader :prompts, :correct_answers, :incorrect_answers

  def initialize
    
    url = "https://opentdb.com/api.php?amount=5&category=22&difficulty=easy&type=multiple"
    response = HTTParty.get(url)

    #create instance array of question prompts
    @prompts = [

      response.parsed_response["results"][0]["question"],
      response.parsed_response["results"][1]["question"], 
      response.parsed_response["results"][2]["question"], 
      response.parsed_response["results"][3]["question"], 
      response.parsed_response["results"][4]["question"] 
    
    ]
    
    #create instance array of correct answers
    @correct_answers = [
      
      response.parsed_response["results"][0]["correct_answer"],
      response.parsed_response["results"][1]["correct_answer"],
      response.parsed_response["results"][2]["correct_answer"],
      response.parsed_response["results"][3]["correct_answer"],
      response.parsed_response["results"][4]["correct_answer"]
      
    ]  
    
    #create instance array of incorrect answers
    @incorrect_answers = [
      
      response.parsed_response["results"][0]["incorrect_answers"],
      response.parsed_response["results"][1]["incorrect_answers"],
      response.parsed_response["results"][2]["incorrect_answers"],
      response.parsed_response["results"][3]["incorrect_answers"],
      response.parsed_response["results"][4]["incorrect_answers"]
      
    ]
    
    #remove HTMLEntities
    coder = HTMLEntities.new
    @prompts = @prompts.map {|item| coder.decode(item)}
    @correct_answers = @correct_answers.map {|item| coder.decode(item)}
  
  end

end
