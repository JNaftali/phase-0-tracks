puts "How many new employees will be processed?"
counter = gets.chomp.to_i

until counter == 0

  puts "Greetings, new employee! Welcome to Werewolves Inc! What is your name?"
  name = gets.chomp

  puts "How old are you?"
  age = gets.chomp.to_i

  puts "What year were you born?"
  birthyear = gets.chomp.to_i

  age = age == Time.now.year - birthyear

  puts "Our company cafeteria serves garlic bread. Should we order some for you?"
  garlic = gets.chomp.include? "yes"

  puts "Would you like to enroll in the company’s health insurance?"
  insurance = gets.chomp.include? "yes"

  allergy = "temp"
  while allergy != "done"
    puts "Do you have any more allergies? If so, please name one."
    allergy = gets.chomp
    if allergy === "sunshine"
      puts "Probably a vampire."
      break
    end
  end
  if allergy === "sunshine"
    counter = counter - 1
    next
  end

  result = "Results inconclusive."

  if age && ( garlic || insurance)
    result = "Probably not a vampire."
  end

  if !age && ( !garlic || !insurance)
    result = "Probably a vampire."
  end

  if !( age || garlic || insurance)
    result = "Almost certainly a vampire."
  end

  case name
  when "Drake Cula", "Tu Fang"
    result = "Definitely a vampire."
  end

  puts result
  counter -= 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."