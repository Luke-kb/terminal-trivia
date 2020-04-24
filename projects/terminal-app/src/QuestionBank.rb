require 'httparty'
require 'htmlentities'

class QuestionBank
  attr_reader :prompts, :correct_answers, :incorrect_answers
  #:question_bank, :correct_answer1, :correct_answer2, :correct_answer3, :correct_answer4, :correct_answer5,
  #:incorrect_answers1, :incorrect_answers2, :incorrect_answers3, :incorrect_answers4, :incorrect_answers5,
  #:q_prompt1, :q_prompt2, :q_prompt3, :q_prompt4, :q_prompt5

  def initialize
    
    url = "https://opentdb.com/api.php?amount=5&category=22&difficulty=easy&type=multiple"
    response = HTTParty.get(url)
    
    #example of htmlentities
    # coder = HTMLEntities.new
    # string = "&eacute;lan"
    # coder.decode(string) # => "élan"


    #create instance array of question prompts
    @prompts = [
      
      encode(response.parsed_response["results"][0]["question"]),
      encode(response.parsed_response["results"][1]["question"]), 
      encode(response.parsed_response["results"][2]["question"]), 
      encode(response.parsed_response["results"][3]["question"]), 
      encode(response.parsed_response["results"][4]["question"]) 
      
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
      

  end

end
