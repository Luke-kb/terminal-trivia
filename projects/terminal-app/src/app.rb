require 'tty-prompt'
require 'tty-cursor'
require 'tty-progressbar'
require 'tty-box'
require 'artii'
require 'colorize'
require 'faker'
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

#hide cursor for welcome 
@cursor.invisible {

welcome #display welcome screen
sleep 2
any_key("Press any key to continue..")
print @cursor.clear_lines(2, :up)

}

check_username

print @cursor.clear_lines(4, :up) #clear lines
any_key("READY? hit any key..")
print @cursor.clear_lines(3, :up)
print @cursor.down(1)

#run quiz questions
quiz_loop

#show score
get_score



