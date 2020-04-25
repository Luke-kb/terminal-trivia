#clears the terminal
def clear
system 'clear'
end

#progressbar
def prog_bar
  bar = TTY::ProgressBar.new("[:bar]", total: 10)
  30.times do
    sleep(1)
    bar.advance(1)
  end
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

#welcome message 
def welcome
  clear
  slow("welcome to", 0.08)
  sleep 0.5
  print "\n"
  clear
  title
end

#press any key to continue prompt
def any_key(message)
  prompt = TTY::Prompt.new
  prompt.keypress(message)
end

#username input & validation
def check_username
  
  loop = true

  while loop
    prompt = TTY::Prompt.new
    user_input = prompt.ask('Please enter your username: ') do |q|
      q.required true
      q.validate(/^[a-zA-Z]+$/, 'letters only')    #letters only
      q.modify :remove, :capitalize    #remove whitespace & capitalize
      # q.validate(/[A-Za-z0-9]/, 'Letters and numbers only')    #letters and numbers only
    end

    print @cursor.clear_lines(2, :up)
    puts "Welcome #{user_input.colorize(:cyan)}!"
    puts "\n"
    sleep 1.5
    choices = %w(yes no exit)
    confirm = prompt.select('Is this username correct?', choices)

    case confirm
    when "yes"
      @username = user_input
      loop = false
    when "no"
      print @cursor.clear_lines(4, :up)
    when "exit"
      exit_app
      loop = false
    end
  end
end

def exit_app
  clear
  puts "BYE."
  sleep 2
  exit    ####find out how to close terminal window
end


def quiz_loop

  #ask up to 5 questions
  while @question_index < 5
    ask_question(@question_index)
    @question_index += 1
    #add method to insert faker comment?
  end

  any_key("Press any key to view your score!") 

end


def ask_question(question_index)
  
  #create tty-prompt instance
  question_ask = TTY::Prompt.new
  
  #ask the question
  user_answer = question_ask.select("#{@questions.prompts[@question_index]}", @questions.incorrect_answers[@question_index].push(@questions.correct_answers[@question_index]).shuffle)
  #keep score
  if user_answer != @questions.correct_answers[@question_index]
    # p @score
    add_to_score((@question_index), user_answer, 0)
    p @score
    sleep 3
    print @cursor.clear_lines(4, :up)
    print @cursor.down(1)
    # print "#{Faker::Quote.robin.colorize(:cyan)} !" 
    # sleep 1
    # print @cursor.clear_lines(5, :up)
    # print @cursor.down(2)
    # prog_bar
    # any_key("\nhit spacebar to continue..")
  else 
    # p @score
    add_to_score(@question_index, user_answer, 1)
    p @score
    # @score[question_index + 1] += 1
    sleep 3
    print @cursor.clear_lines(4, :up)
    print @cursor.down(1)
    # print "#{Faker::Quote.robin.colorize(:cyan)} !" 
    # sleep 1
    # print @cursor.clear_lines(5, :up)
    # @score = @score
    # print @cursor.down(2)
    # prog_bar
    # any_key("\nhit spacebar to continue..")
  end
end

def add_to_score(key, value, num)

  @score["Q#{key + 1}"] = "#{value}"
  @score[:score] += num

end

#show user the score
def print_score

  puts "You scored #{@score[:score]} out of #{@question_index}"

end

def score_table


end
