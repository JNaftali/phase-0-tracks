class Santa

  def speak
    p "Ho, ho, ho! Haaappy holidays!"
  end

  def eat_milk_and_cookies (cookie_type)
    p "That was a good #{cookie_type}!"
  end

  def initialize (gender, ethnicity )
    p "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def print
    puts "This santa is #{@ethnicity} and considers themselves to be #{@gender}"
  end
end

#robert = Santa.new
#robert.speak
#robert.eat_milk_and_cookies("chocolate chip cookie")

santas = []
genders = ["agender", "female", "bigender", "male", "gender fluid", "N/A", "neuter"]
ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "unimportant", "Scandinavian", "Reubenesque"]


10.times do |i|
  n = Random.new()
  g = -n.rand(genders.length)
  e = -n.rand(ethnicities.length)
  santas << Santa.new(genders[g], ethnicities[e])
  santas[i-1].print
end