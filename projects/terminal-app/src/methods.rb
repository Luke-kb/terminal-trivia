#clears the terminal
def clear
system 'clear'
end

#progressbar
def prog_bar(num)
  bar = TTY::ProgressBar.new("[:bar]", total: num)
  num.times do
    sleep(0.2)
    bar.advance(1)
  end
end

#disappearing effect
def clear_line_slowly(num)
  x = 0
 
  while x < num
    print @cursor.clear_lines(2, :up)
    sleep 0.1
    x += 1
  end
end

#simple spinner
def simple_spin(seconds, spin_type)
  spinner = TTY::Spinner.new(format: :"#{spin_type}", interval: 10)
  spinner.run do |spinner|
    sleep seconds
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

#title graphic
def title
  title = Artii::Base.new
  puts title.asciify('Terminal Trivia !')
  # system("artii 'Terminal Trivia !' | lolcat")
end

#welcome message 
def welcome
  clear
  print @cursor.down(5)
  print "3"
  sleep 0.5
  print @cursor.clear_line
  print "2"
  sleep 0.5
  print @cursor.clear_line
  print "1"
  sleep 0.5
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
    user_input = prompt.ask('Enter your username:') do |q|
      q.required true
      q.validate(/^[a-zA-Z]+$/, 'letters only')    #letters only
      q.modify :remove, :capitalize    #remove whitespace & capitalize
      # q.validate(/[A-Za-z0-9]/, 'Letters and numbers only')    #letters and numbers only
    end

    print @cursor.clear_lines(2, :up)
    simple_spin(1.5, "pulse_3")
    print @cursor.clear_lines(2, :up)
    puts "Welcome #{user_input.upcase.colorize(:cyan)}!"
    print @cursor.down(1)
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

  # any_key("Press any key to view your score!") 
  puts "processing scores.."
  prog_bar(8)
  print @cursor.clear_lines(2, :up)
end

#ask question method
def ask_question(question_index)
  
  question_ask = TTY::Prompt.new   #create tty-prompt instance

  #ask the question
  user_answer = question_ask.select("#{@questions.prompts[@question_index]}", @questions.incorrect_answers[@question_index].push(@questions.correct_answers[@question_index]).shuffle)
  
  #keep score
  if user_answer != @questions.correct_answers[@question_index]
    add_to_score((@question_index), user_answer, 0)
    @rows << [@questions.prompts[@question_index]]
    @rows << ["#{user_answer.colorize(:red)} => #{@questions.correct_answers[@question_index]}"]
    # sleep 1
    print @cursor.clear_lines(2, :up)
    # print @cursor.down(1)
  else 
    add_to_score(@question_index, user_answer, 1)
    @rows << [@questions.prompts[@question_index]]
    @rows << ["#{user_answer.colorize(:green)}"]
    # sleep 0.5
    print @cursor.clear_lines(2, :up)
    # print @cursor.down(1)
  end
  # p @score
end

#add to score once each question is answered
def add_to_score(key, value, num)

  @score["Q#{key + 1}"] = "#{value}"
  @score[:score] += num

end

#show user the score
def print_score
  system("artii 'You scored #{@score[:score]} out of #{@question_index}' | lolcat -a -d 10 -S 0")
  # system "You scored #{@score[:score]} out of #{@question_index}"

end

def score_table

  table = Terminal::Table.new :rows => @rows, :title => "#{@username}'s results"
  # table.style = {:all_separators => true}
  puts table

end

#play again?
def play_again
  clear
  prompt = TTY::Prompt.new
  choices = %w(yep! exit)
  confirm = prompt.select('Play again?', choices)

end

