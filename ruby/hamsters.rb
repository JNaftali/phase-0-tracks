<<-DOC

hamster_name = ""
volume_level is float btw 1 - 10
fur_color is string
good_cand is boolean
est_age is integer

DOC

puts "Hello what is the name of the hamster that you are trying to register?"
hamster_name = gets.chomp

puts "How loud is this hamster, on a scale from 1 to 10?"
volume_level = gets.chomp.to_f

puts "What is the hamster's fur color?"
fur_color = gets.chomp

puts "Is this hamster a good candidate for adoption?"
good_cand = gets.chomp
if good_cand != "no"
  good_cand = true
else
  good_cand = false
end

puts "Roughly how old is this hamster?"
est_age = gets.chomp
if est_age === ""
  est_age = nil
else
  est_age = est_age.to_i
end

hamster_data = "#{hamster_name} has #{fur_color} fur, and is "

if volume_level <= 3
  hamster_data = hamster_data + "very quiet. "
elsif volume_level <= 6
  hamster_data = hamster_data + "talkative. "
else
    hamster_data = hamster_data + "very loud. "
end

if good_cand
  hamster_data = hamster_data + "He is thought to be an excellent candidate for adoption. "
else
  hamster_data = hamster_data + "He is thought to be a poor candidate for adoption. "
end

if est_age === nil
  hamster_data = hamster_data + "We are not sure how old he is."
else
  hamster_data = hamster_data + "He is roughly #{est_age} years old."
end

puts hamster_data