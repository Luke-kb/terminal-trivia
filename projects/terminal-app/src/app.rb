require 'tty-box'
require 'tty-cursor'
require 'tty-progressbar'
require 'tty-prompt'
require 'tty-spinner'
require 'terminal-table'
require 'colorize'
require 'artii'
require 'lolcat'
require_relative './QuestionBank.rb'
require_relative './methods.rb'
# require_relative './Score.rb'

@score = {score: 0}
@username = ""
@question_index = 0
@question_amount = 5
@rows = []

#set @cursor variable
@cursor = TTY::Cursor
#create QuestionBank instance
@questions = QuestionBank.new

#hide cursor 
@cursor.invisible {

#display welcome message and title graphic  
welcome 
sleep 1
any_key("Press any key to continue..")
print @cursor.clear_lines(2, :up)
simple_spin(1, "pulse_3")
print @cursor.clear_lines(2, :up)

check_username

print @cursor.clear_lines(4, :up) 
any_key("READY? hit spacebar for the first question..")
print @cursor.clear_lines(3, :up)
print @cursor.down(1)

#run quiz questions
quiz_loop

print @cursor.clear_lines(2, :up)

clear
#show score
print_score
puts "\n"
score_table
any_key("press spacebar")
clear_line_slowly(30)
play_again
}
