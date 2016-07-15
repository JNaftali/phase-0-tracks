# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# like require but takes a filepath relative to the current
# file.
require_relative 'state_data'

class VirusPredictor

  # initializes instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # passes the instance variables to predicted_deaths and speed_of_spread methods
  def virus_effects
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private

  # calculates the number of deaths based on population and
  # population density, then prints it out
  def predicted_deaths
    # predicted deaths is solely based on population density
    case @population_density
    when (1..49)
      factor = 0.05
    when (50..99)
      factor = 0.1
    when (100..149)
      factor = 0.2
    when (150..199)
      factor = 0.3
    else
      factor = 0.4
    end

    (@population * factor).floor
  end

  # calculates the speed the virus will spread based on
  # population density and ? and prints it out.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 2.5
    (1..4).each do | i |
      break unless @population_density >= 50 * i
      speed -= 0.5
    end
    speed
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, hash|
  VirusPredictor.new(state, hash[:population_density], hash[:population]).virus_effects
end

#=======================================================================
=begin

Reflection Section

* One stores the keys as strings, the other as symbols. Symbols as hash keys are a big performance boost when used as (basically) column headings because even though they're used over 50 times each ruby only needs to remember each symbol once.

* require_relative loads the code of another document into this document. It uses a filepath relative to the folder that contains the document where it is called instead of an absolute filepath (relative to the root of the filesystem).

* most commonly you'll use each, although if you only need the kays/values you can iterate through each of them as well. If you don't mind destroying the hash you can also use ((while hash do hash.shift end))

* the variables that were passed to the instance methods were all instance variables and could therefore be called directly from any instance method

* Don't store more things than you have to. If you design your class so that instances can be created, called, and discarded in one line it will make your driver code much cleaner and keep your code from slowing down the system.
end