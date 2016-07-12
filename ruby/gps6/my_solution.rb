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
    print "#{@state} will lose #{predicted_deaths} people in this outbreak"
    speed_of_spread
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
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, hash|
  VirusPredictor.new(state, hash[:population_density], hash[:population]).virus_effects
end

#=======================================================================
# Reflection Section