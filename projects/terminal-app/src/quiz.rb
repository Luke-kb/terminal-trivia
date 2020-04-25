

# def quiz

#   #create QuestionBank instance and grab question data
#   questions = QuestionBank.new
  
#   # are you ready prompt
#   slow("Are you ready to begin?\n", 0.08)
#   sleep 1
#   any_key("press any key to continue..")
  
#   #clear screen
#   clear
  
#   #print Question 1
#   prompt = TTY::Prompt.new
#   user_answer = prompt.select("#{questions.q_prompt1}", questions.incorrect_answers1.push(questions.correct_answer1).shuffle)
  
#   #validate Question 1
#   if user_answer == questions.correct_answer1
#     @score =+ 1
#     any_key("Press spacebar to continue.")
#   else
#     puts "Feeling lucky?"
#     sleep 2
#     any_key("Press spacebar to continue.")
#   end
  
#   #print Question 2
#   clear
#   user_answer = prompt.select("#{questions.q_prompt2}", questions.incorrect_answers2.push(questions.correct_answer2).shuffle)

#   #validate Question 2
#   if user_answer == questions.correct_answer2
#     @score =+ 1
#     any_key("Press spacebar to continue.")
#   else
#     puts "Feeling lucky?"
#     sleep 2
#     any_key("Press spacebar to continue.")
#   end
  
#   #print Question 3
#   clear
#   user_answer = prompt.select("#{questions.q_prompt3}", questions.incorrect_answers3.push(questions.correct_answer3).shuffle)

#   #validate Question 3
#   if user_answer == questions.correct_answer3
#     @score =+ 1
#     any_key("Press spacebar to continue.")
#   else
#     puts "Feeling lucky?"
#     sleep 2
#     any_key("Press spacebar to continue.")
#   end

#   #print Question 4
#   clear
#   user_answer = prompt.select("#{questions.q_prompt4}", questions.incorrect_answers4.push(questions.correct_answer4).shuffle)

#   #validate Question 4
#   if user_answer == questions.correct_answer4 
#     @score =+ 1
#     any_key("Press spacebar to continue.")
#   else
#     puts "Feeling lucky?"
#     sleep 2
#     any_key("Press spacebar to continue.")
#   end

#   #print Question 5
#   clear
#   user_answer = prompt.select("#{questions.q_prompt5}", questions.incorrect_answers5.push(questions.correct_answer5).shuffle)

#   #validate Question 5
#   if user_answer == questions.correct_answer5
#     @score =+ 1
#     any_key("Press spacebar to view your score!")
#   else
#     puts "Feeling lucky?"
#     sleep 2
#     any_key("Press spacebar to view your score!")
#   end
# end