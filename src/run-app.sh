#!/bin/bash

clear

echo "Welcome to **TERMINAL TRIVIA**"

echo "Time to ensure all required gems are installed"

bundle install

gem update --system

echo "All gems have been installed, running TERMINAL TRIVIA for the first time now!"

ruby app.rb