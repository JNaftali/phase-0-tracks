#Greet user, initialize empty hash
puts "Hello! Aren't you looking fabulous today! Lets add a new client."
client = Hash.new()

#Ask for customer information and plug into hash:
#Name
puts "What is the client's name?"
client[:name] = gets.chomp

#Age
puts "How old are they?"
client[:age] = gets.chomp.to_i

#Number of children
puts "How many children do they have?"
client[:kids] = gets.chomp.to_i

#Decor theme
puts "Have they chosen a preferred theme?"
client[:theme] =  gets.chomp

#Prefer brand names?
puts "Do they prefer to use brand names?"

until client[:brands] == true || client[:brands] == false
  client[:brands] = gets.chomp.downcase
  case client[:brands]
    when "y", "yes", "true"
      client[:brands] = true
    when "n", "no", "false"
      client[:brands] = false
    else
      puts "I'm sorry, please respond with either yes or no."
  end
end

#Puts the content of the hash.
puts "So #{client[:name]} is #{client[:age]} years old and has #{client[:kids]} children.  They have decided that they want #{client[:theme]} themed decor and does#{client[:brands] ? "" : "n't"} want us to use brand names wherever possible."

#Ask if they want to make changes
puts 'Do you want to fix any of this information? If not, enter "none".'
fix = gets.chomp.to_sym

#Unless they say none, give them a chance to change a value
unless fix == :none
  #Which key do you want to change?
  while client[fix].nil?
    puts "I'm sorry, could you repeat that?"
    fix = gets.chomp.to_sym
  end

  #Remind them of the old value and ask for the new one.
  puts "Ok, and you want to change '#{client[fix]}' to what?"
  client[fix] = gets.chomp

  #re-print the hash
  puts "So #{client[:name]} is #{client[:age]} years old and has #{client[:kids]} children.  They have decided that they want #{client[:theme]} themed decor and does#{client[:brands] ? "" : "n't"} want us to use brand names wherever possible."
end

#And we're done
puts "Ok, seeya later!"
client