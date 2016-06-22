animals = [ "dog", "cat", "bird", "dolphin", "elephant" ]
roles = {
  keanu_reaves: "The Matrix",
  mark_hamill: "Star Wars",
  tom_hanks: "Forest Gump",
  tom_cruise: "Mission Impossible"
}

p animals
animals.each do |animal|
  p animal.capitalize
end
p animals
animals.map! { |animal| animal.capitalize }
p animals

p roles
roles.each do | actor, movie |
  p "#{actor} performed in #{movie}"
end