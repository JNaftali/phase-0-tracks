module Shout
  #def self.yell_angrily(words)
  #  words + "!!!" + " :("
  #end
#
  #def self.yelling_happily(words)
  #  words + "!!!" + " :D"
  #end
  def yell_angrily(words)
    words + "!!!" + " :("
  end
  def yelling_happily(words)
    words + "!!!" + " :D"
  end
end

class Loud_Kiddington
  include Shout
end

class Bullhorn
  include Shout
end

kid = Loud_Kiddington.new
p kid.yelling_happily("BOOOM")

bullhorn = Bullhorn.new
p bullhorn.yell_angrily("Out of the way!")