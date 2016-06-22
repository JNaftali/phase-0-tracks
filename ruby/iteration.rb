animals = [ "cat", "dog",  "bird", "dolphin", "elephant" ]
roles = {
  keanu_reaves: "The Matrix",
  mark_hamill: "Star Wars",
  tom_hanks: "Forest Gump",
  tom_cruise: "Mission Impossible"
}

#p animals
#animals.each do |animal|
#  p animal.capitalize
#end
#p animals
#animals.map! { |animal| animal.capitalize }
#p animals
#
#p roles
#roles.each do | actor, movie |
#  p "#{actor} performed in #{movie}"
#end

#Release 2
#1
#animals.delete_if { |animal| animal.length < 4 }
#p animals
#
#roles.delete_if { |actor, movie| movie.length > actor.length }
#p roles

#2
#p animals.select { |animal| animal[0] == "d" }

#p roles.select { |actor, movie| actor.to_s[0..2] == "tom" }

#3
#p animals.keep_if { |animal| animal[0] == "d" }

#p roles.keep_if { |actor, movie| actor.to_s[0..2] == "tom" }

#4
#p animals.drop_while { |animal| animal.include?("a") }

#p roles.reject { |actor, movie| actor.length < 10 }