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

#set difficulty to 'god' level using ARGV
def process_argv(option)
  case option
  when "-g"  #god level
    @url = "https://opentdb.com/api.php?amount=&difficulty=hard&type=multiple"
  end
end

#disappearing text effect
def clear_lines_slowly(num)
  x = 0
  while x < num
    print @cursor.clear_lines(2, :up)
    sleep 0.09
    x += 1
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
end

#welcome message 
def welcome
  clear
  print @cursor.invisible {

  print "IT'S".colorize(:blue)
  sleep 1.3
  print @cursor.clear_line
  print "TIME".colorize(:blue)
  sleep 1
  print @cursor.clear_line
  print "FOR".colorize(:blue)
  sleep 1
  clear
  title
  sleep 0.6
  any_key("Press any key to continue..")
  print @cursor.clear_lines(2, :up) }
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
    puts "You entered: #{user_input.upcase.colorize(:cyan)}"
    sleep 0.3
    print @cursor.down(1)

    choices = %w(Yes No Exit)
    confirm = prompt.select('Is this username correct?', choices)

    case confirm
    when "Yes"
      @username = user_input.upcase
      clear
      puts "Welcome #{@username}!"
      sleep 1.3 
      print @cursor.clear_line     
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
  bye = Artii::Base.new
  puts bye.asciify('Bye!')
  sleep 2.5
  clear
  system exit   
end

def quiz
  
  if @god_mode == "-g"
    url = "https://opentdb.com/api.php?amount=15&difficulty=hard&type=multiple" 
    @difficulty = "GOD"
  end

  questions = QuestionBank.new(url)   #create QuestionBank instance
  puts slow("\n#{questions.q_amount} questions. multiple choice. general knowledge. Level: #{questions.difficulty}.", 0.2)
  sleep 1
  any_key("READY?\n\n(hit spacebar to begin)")
  p questions
  clear

  score = Score.new     #create Score instance

  ask_prompt = TTY::Prompt.new(active_color: :cyan)     #create tty-prompt instance
   
  #loop begins
  while questions.q_index < questions.q_amount

  #ask the question
  user_answer = ask_prompt.select("#{questions.prompts[questions.q_index]}", questions.incorrect_answers[questions.q_index].push(questions.correct_answers[questions.q_index]).shuffle)
    
    #keep score
    if user_answer != questions.correct_answers[questions.q_index]
      score.count += 0
      # add_to_score((questions.q_index), user_answer, 0)
      # add_to_score((@question_index), user_answer, 0)
      score.results << [questions.prompts[questions.q_index]]
      score.results << ["#{user_answer.colorize(:red)} => #{questions.correct_answers[questions.q_index]}"]
      clear
    else 
      score.count += 1
      # add_to_score(@question_index, user_answer, 1)
      score.results << [questions.prompts[questions.q_index]]
      score.results << ["#{user_answer}  :-)".colorize(:green)]
      clear
    end
    questions.q_index += 1
  end
  clear
  puts "processing your score.."
  prog_bar(8)
  sleep 0.5

  #print score and results
  clear
  system("artii 'You scored  :' | lolcat -a -d 8 -S 0")
  system("artii ' #{score.count} out of #{questions.q_amount}' | lolcat -a -d 6 -S 0")
  sleep 0.2
  clear
  print @cursor.down(1)
  score.results.each do |item| 
    puts item
    puts "\n"
    sleep 0.7
  end
  if score.count < questions.q_amount
    any_key("\n\nBetter luck next time!   (hit spacebar)".colorize(:cyan))
  else 
    any_key("\n\nYOU ARE AWESOME!   (hit spacebar)")
  end
  clear_lines_slowly(28)
  clear
end

#play again or exit
def play_again
  clear
  prompt = TTY::Prompt.new
  choices = %w(Sure Exit)
  confirm = prompt.select('Play again?', choices)
  case confirm
  when "Exit"
    exit_app
  when "Sure"
    reset
  end
end

