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

  #split the parameter into first and last names, switch them, and put them back together
  full_name.split(" ").reverse.join(" ")
end

p spy_name("Josh Marantz")