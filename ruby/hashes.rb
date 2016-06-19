#Greet user, initialize empty hash
puts "Hello! Aren't you looking fabulous today! Lets add a new client."
client = Hash.new("I don't know")

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

p client