class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender

  def initialize (gender, ethnicity )
    p "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    p "Ho, ho, ho! Haaappy holidays!"
  end

  def eat_milk_and_cookies (cookie_type)
    p "That was a good #{cookie_type}!"
  end

  def print
    puts "This santa is #{@ethnicity} and considers themselves to be #{@gender}"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at (reindeer)
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking.push(reindeer)
  end

  def least_favorite
    @reindeer_ranking[-1]
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
end

30.times { santas[2].celebrate_birthday }
p santas[2].age
p santas[2].ethnicity
p santas[2].gender
santas[2].gender = "trisexual"
p santas[2].gender
p santas[2].least_favorite
santas[2].get_mad_at("Dasher")
p santas[2].least_favorite