puts "Greetings, new employee! Welcome to Werewolves Inc! What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birthyear = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic = gets.chomp

puts "Would you like to enroll in the company’s health insurance?"
insurance = gets.chomp

puts name + age.to_s + birthyear.to_s + garlic + insurance