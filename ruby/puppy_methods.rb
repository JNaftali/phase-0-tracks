class Puppy

  def initialize
    p "initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def woof ( times )
    p "woof " * times
  end

  def roll_over
    p "*rolls over*"
  end

  def dog_years ( h_years )
    if h_years <= 2
      p h_years * 10.5
    else
      p 21 + ( ( h_years - 2 ) * 4 )
    end
  end

  def chase_tail
    p "*spins around in circles*"
  end
end

spot = Puppy.new
#spot.fetch("ball")

#spot.woof(5)

#spot.dog_years(3)

#spot.chase_tail