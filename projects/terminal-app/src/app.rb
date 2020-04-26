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


@username = ""
@cursor = TTY::Cursor #set @cursor variable

#ARGV 
# ARGV.each { |option| process_argv(option) }


welcome #display welcome message and title graphic   

print @cursor.clear_lines(2, :up)

username #input and check username

quiz  #run quiz questions

any_key("\n\npress any key".colorize(:cyan))
clear_line_slowly(28)
play_again

