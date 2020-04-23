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

#welcome screen
welcome
any_key("Press any key to continue..")


clear       #until I can get tty-cursor working..
title     

check_username

#run quiz questions
quiz

#show score
get_score



