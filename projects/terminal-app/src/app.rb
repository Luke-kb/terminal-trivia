require 'tty-prompt'
require 'tty-cursor'
require 'tty-box'
require 'artii'
require 'colorize'
require_relative './QuestionBank.rb'
require_relative './methods.rb'
# require_relative './Score.rb' #not required atm

@score = 0
@username = ""
@question_index = 0

#set tty variables
@cursor = TTY::Cursor
#create QuestionBank instance and grab question data
@questions = QuestionBank.new

#hide cursor for duration of program
@cursor.invisible {

#display welcome screen
welcome
sleep 2
any_key("Press any key to continue..")
print @cursor.clear_lines(2, :up)
# print @cursor.up(1)
# print @cursor.down(1)
check_username

#run quiz questions
quiz_loop

#show score
get_score

}

