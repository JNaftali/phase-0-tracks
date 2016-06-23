class Santa

  def speak
    p "Ho, ho, ho! Haaappy holidays!"
  end

  def eat_milk_and_cookies (cookie_type)
    p "That was a good #{cookie_type}!"
  end

  def initialize
    p "Initializing Santa instance..."
  end

end

robert = Santa.new
robert.speak
robert.eat_milk_and_cookies("chocolate chip cookie")