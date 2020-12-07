require 'httparty'
require 'htmlentities'

class QuestionBank
  attr_reader :prompts, :correct_answers, :incorrect_answers, :q_amount, :difficulty
  attr_accessor :q_index

  def initialize(url = nil)

    #if command line argument not given, use default url
    if !url
      url = "https://opentdb.com/api.php?amount=6&difficulty=easy&type=multiple"
    end

    #error handling if internet not connected 
    begin
      response = HTTParty.get(url)
    rescue SocketError
      puts "SocketError! Check internet connection!"
    end

    #create difficulty instance variable      
    @difficulty = response.parsed_response["results"][0]["difficulty"].upcase

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

    #remove HTMLEntities from array variables
    html = HTMLEntities.new 

    @prompts = @prompts.map {|item| html.decode(item)}
    @correct_answers = @correct_answers.map {|item| html.decode(item)}
    @incorrect_answers = @incorrect_answers.map {|row| row.map {|item| html.decode(item)}} 

  end

end
