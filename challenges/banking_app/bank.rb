# Implement a simple banking app. Write a program to implement a simple bank account. 
# It should have the following features, which you should build one at a time.

# 1. The initial balance should be 0. Show this on screen when the app runs. E.g:

# Your balance is $0

# 2. Use puts to display a nice welcome message. E.g:

# Welcome to the banking app
# Your balance is $0

# 3. Let the user determine the output. Ask them what they would like to do. If they type balance and hit return, show them their balance! Currently the only option is balance. E.g:

# Welcome to the banking app
# What would you like to do? (options: balance)
# *user types balance*
# Your balance is $0

# 4. If the user types anything other than balance, say “Invalid selection!”

# Welcome to the banking app
# What would you like to do? (options: balance)
# *user types kanye*
# Invalid selection!
#---------------------------------------------
	
def banking_app
	# set initial balance
	balance = 0
	password = "sardines"
			
	#clear screen method	
	def clear_screen
		system "clear"
	end

	clear_screen()

	puts "Welcome to the banking app."
	sleep(1)
	loop do
		puts "please enter the password: "
		password_input = gets.strip
		
		if password_input == "sardines"
			puts "Access Granted!"
		break
		end
		puts "Password incorrect. Try again"
	end
		
	#greeting
	sleep(1)
	puts "Your balance is $#{balance}"

	loop do
		sleep(1)
		puts "What would you like to do? (options: balance; deposit; withdrawal; exit)"
		#user provides input
		user_input = gets.strip.downcase 
		#case statement inside loop
		case user_input
		
		when "balance"
			clear_screen
			puts "Your balance is.."
			sleep(1)
			puts "$#{balance}"
		
		when "deposit"
			clear_screen
			puts "How much would you like to deposit? (whole dollar amounts only):"
		deposit_amount = gets.strip.to_i
		balance += deposit_amount
		puts "Congratulations! Your balance is now.."
		sleep(1)
		puts "$#{balance}"
		
		when "withdrawal"
		clear_screen
		puts "How much would you like to withdraw? (whole dollar amounts only):"
		withdraw_amount = gets.strip.to_i
		# control flow for withdrawal action
			if withdraw_amount < balance
				balance =- withdraw_amount
				clear_screen
				puts "Your balance is now $#{balance}"
			else withdraw_amount > balance	
				clear_screen
				puts "You have insufficient funds to withdraw that amount!"
			end
		
		when "exit"
			clear_screen
			puts "Goodbye."
		break
			
		else
		clear_screen
		puts "Invalid selection!"
		end
	end
end

banking_app()





