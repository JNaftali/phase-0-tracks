def shiftchar (char, shift)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  if alphabet.index(char) == nil
    char
  elsif alphabet.index(char) + shift + 1 > alphabet.length
    alphabet[alphabet.index(char) + shift - alphabet.length] 
  else
    alphabet[alphabet.index(char) + shift]
  end
end

def encrypt (message, key)
  result = ""
  message.each_char{|c| result += shiftchar(c, key)}
  result
end

def decrypt (message, key)
  result = ""
  message.each_char{|c| result += shiftchar(c, -key)}
  result
end

def fancy_encrypt (message, key)
  key = key.split
  result = ""
  i = 0

  while i < message.length
    thiskey = key[i % key.length].to_i
    result += shiftchar(message[i],thiskey)
    i += 1
  end
  result
end

def fancy_decrypt (message, key)
  key = key.split
  result = ""
  i = 0

  while i < message.length
    thiskey = key[i % key.length].to_i
    result += shiftchar(message[i],-thiskey)
    i += 1
  end
  result
end

#p encrypt("this is a test messagez", -1)
#p decrypt(encrypt("this is a test messagez", -1), -1)
test = "this is a test messagez"
testkey = "-1 1 3 7"
p fancy_encrypt(test, testkey)
p fancy_decrypt(fancy_encrypt(test, testkey), testkey)