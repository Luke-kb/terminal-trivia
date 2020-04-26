require 'tty-cursor'
require 'tty-progressbar'
require 'tty-prompt'
require 'tty-spinner'
require 'colorize'
require 'artii'
require 'lolcat'
require_relative './QuestionBank.rb'
require_relative './methods.rb'
require_relative './Score.rb'

# #create QuestionBank instance
# questions = QuestionBank.new


# @score = {score: 0}
@username = ""
# @question_index = 0
# @question_amount = 5
# #score table array
# @rows = []
#set @cursor variable
@cursor = TTY::Cursor

#ARGV 
ARGV.each { |option| process_argv(option) }

# #hide cursor 
# @cursor.invisible {}

#display welcome message and title graphic  
welcome 
sleep 1
any_key("Press any key to continue..")
print @cursor.clear_lines(2, :up)
simple_spin(1, "pulse_3")
print @cursor.clear_lines(2, :up)

#input and checl username
username
#run quiz questions
quiz_loop

# print @cursor.clear_lines(2, :up)

any_key("\n\npress any key".colorize(:cyan))
clear_line_slowly(28)
play_again

