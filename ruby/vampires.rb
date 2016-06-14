puts "Greetings, new employee! Welcome to Werewolves Inc! What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birthyear = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic = gets.chomp

if garlic.include? "yes"
  garlic = true
else
  garlic = false
end

puts "Would you like to enroll in the company’s health insurance?"
insurance = gets.chomp

if insurance.include? "yes"
  insurance = true
else
  insurance = false
end

result = "Results inconclusive."

if age === Time.now.year - birthyear && (garlic || insurance)
  result = "Probably not a vampire."
end

if age != Time.now.year - birthyear && (!garlic || !insurance)
  result = "Probably a vampire."
end

if !(age === Time.now.year - birthyear || garlic || insurance)
  result = "Almost certainly a vampire."
end

case name
when "Drake Cula", "Tu Fang"
  result = "Definitely a vampire."
end

puts result