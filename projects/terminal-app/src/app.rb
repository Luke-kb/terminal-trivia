require 'tty-box'
require 'tty-cursor'
require 'tty-progressbar'
require 'tty-prompt'
require 'tty-screen'
require 'tty-spinner'
require 'terminal-table'
require 'colorize'
require 'justify'
require 'artii'
require 'lolcat'
require_relative './QuestionBank.rb'
require_relative './methods.rb'
# require_relative './Score.rb'

@score = {score: 0}
@username = ""
@question_index = 0
@question_amount = 5
#score table array
@rows = []
#set @cursor variable
@cursor = TTY::Cursor

ARGV.each { |option| process_argv(option) }

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

username

#run quiz questions
quiz_loop

print @cursor.clear_lines(2, :up)

print_score_and_table

any_key("\n\npress any key".colorize(:blue))
clear_line_slowly(28)
play_again

}
