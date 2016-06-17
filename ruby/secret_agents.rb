#loop through each letter of the string.
#increase each letter, using a counter 
#to keep track of where it is in the word
#

def encrypt (greeting)
  letter = 0

  result = ""
  # use the index to print
  while letter < greeting.length
    if greeting[letter] == "z"
      result += "a"
    elsif greeting[letter] == " "
      result += " "
    else
      result += greeting[letter].next
    end
    letter += 1
  end
  p result
end

#add the alphabet in one string
#find the index of each letter in the alphabet, subtract one, and add that letter to result
#special rules for "a" and " "

def decrypt (greeting)
  letter = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"

  result = ""

  while letter < greeting.length
    if greeting[letter] == "a"
      result += "z"
    elsif greeting[letter] == " "
      result += " "
    else
      result += alphabet[alphabet.index(greeting[letter]) - 1]
    end
    letter += 1
  end

  p result
end

#decrypt(encrypt("swordfish"))
#calls decrypt on the result of encrypt, which turns it back to "swordfish"

puts "Would you like to encrypt or decrypt a password?"

answer = gets.chomp

puts "What is your password?"

password = gets.chomp

if answer == "encrypt"
  encrypt(password)
elsif answer == "decrypt"
  decrypt(password)
else
  puts "Invalid input."
end