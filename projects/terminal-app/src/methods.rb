#clears the terminal
def clear
system 'clear'
end

# progressbar (tty)
def prog_bar(num)
  bar = TTY::ProgressBar.new("[:bar]", total: num)
  num.times do
    sleep(0.2)
    bar.advance(1)
  end
end

#cli-ui progress bar
def blue_prog_bar
  CLI::UI::Progress.progress do |bar|
    100.times do
      bar.tick
    end
  end

end

#set difficulty to god level ARGV
def process_argv(option)
  case option
  when "-g"
    @url = "https://opentdb.com/api.php?amount=5&category=17&difficulty=hard&type=multiple"
  end
end

#disappearing text effect
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
  print "5"
  sleep 0.5
  print @cursor.clear_line
  print "4"
  sleep 0.5
  print @cursor.clear_line
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
def username
  
  loop = true

  while loop
    prompt = TTY::Prompt.new(active_color: :cyan)
    user_input = prompt.ask('Enter a username:') do |q|
      q.required true
      q.validate(/[A-Za-z0-9]/, 'alphanumeric characters only')    #letters and numbers only
      q.modify :remove, :capitalize    #remove whitespace & capitalize
      # q.validate(/^[a-zA-Z]+$/, 'letters only')    #letters only
    end

    print @cursor.clear_lines(2, :up)
    puts "You entered: #{user_input.upcase.colorize(:green)}"
    sleep 0.8
    print @cursor.down(1)

    choices = %w(Yes No Exit)
    confirm = prompt.select('Is this username correct?', choices)

    case confirm
    when "Yes"
      clear
      @username = user_input
      print @cursor.down(1)
      puts "Welcome #{@username}!"
      sleep 1.5
      any_key("\nREADY? (hit spacebar to begin)")
      clear      
      loop = false
    when "No"
      print @cursor.clear_lines(4, :up)
    when "Exit"
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
  clear
  puts "processing your score.."
  prog_bar(8)
  sleep 0.5
end

#ask question method
def ask_question(question_index)
  
  question_ask = TTY::Prompt.new(active_color: :cyan)   #create tty-prompt instance

  #ask the question
  user_answer = question_ask.select("#{@questions.prompts[@question_index]}", @questions.incorrect_answers[@question_index].push(@questions.correct_answers[@question_index]).shuffle)
  
  #keep score
  if user_answer != @questions.correct_answers[@question_index]
    add_to_score((@question_index), user_answer, 0)
    @rows << [@questions.prompts[@question_index]]
    @rows << ["#{user_answer.colorize(:red)} => #{@questions.correct_answers[@question_index]}"]
    clear
  else 
    add_to_score(@question_index, user_answer, 1)
    @rows << [@questions.prompts[@question_index]]
    @rows << ["#{user_answer}  :-)".colorize(:green)]
    clear
  end
end

#add to score once each question is answered
def add_to_score(key, value, num)

  @score["Q#{key + 1}"] = "#{value}"
  @score[:score] += num

end

#show user the score
def print_score_and_table
  clear
  system("artii 'You scored  :' | lolcat -a -d 8 -S 0")
  system("artii ' #{@score[:score]} out of #{@question_index}' | lolcat -a -d 6 -S 0")
  sleep 0.2
  clear

  print @cursor.down(1)

  @rows.each do |item| 
    puts item
    puts "\n"
    sleep 0.7
  end

end


#play again?
def play_again
  clear
  prompt = TTY::Prompt.new
  choices = %w(Yep! Exit)
  confirm = prompt.select('Play again?', choices)
  case confirm
  when "Exit"
    exit_app
  when "Yep!"
    puts "restart app.."
  end
end

