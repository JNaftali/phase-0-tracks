#a slightly modified method I wrote for an expansion of secret_agents.rb from 4.6 - super_secret_agents.rb if you're interested.
#it's purpose is to shift a character to the next one within a given set of characters
def shift_char_in_set (char, charset)
  if !charset.index(char)
    char
  else
    i = charset.index(char) + 1
    i -= charset.length if i >= charset.length
    charset[i]
  end    
end

#figures out if char is a vowel or consonant and shifts it within the appropriate set of characters
def shiftchar (char)

  #define some utility variables - vowels, consonants
  vowels = 'aeiou'
  consonants = 'bcdfghjklmnpqrstvwxyz'
  
  if vowels.include?(char)
    shift_char_in_set(char,vowels)
  else
    shift_char_in_set(char,consonants)
  end
end

#define a method with one parameter, full_name
def spy_name (full_name)

  #go through each character of the argument and shift each appropriately
  full_name = full_name.downcase.chars.map { |c| shiftchar(c) }.join('')

  #split the parameter into first and last names and switch them
  full_name = full_name.split(" ").reverse

  #upcase the first letter of each name and merge them back together
  full_name.map! { | str | str.capitalize }.join(" ")
end

puts "Welcome to the alias maker. Please enter a full name to generate an alias.  To finish either enter 'quit' or nothing at all."
agent_list = {}

until false
  next_name = gets.chomp
  case next_name
  when 'quit', 'q', ''
    break
  when /^\w+\s\w+$/
    puts next_name + '\'s alias is ' + agent_list[next_name] = spy_name(next_name)
  else
    puts "Please enter a full name as follows: Firstname Lastname. You can also finish by pressing 'enter'"
  end
    
end
puts "Very well.  Here is a list of all the agents:"
agent_list.each { | name, spyname | puts name + ' shall be known as ' + spyname }
puts "Goodbye"