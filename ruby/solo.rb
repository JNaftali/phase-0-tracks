#Spells! Because I'm a dork.
#also, is it weird that I almost hope we touch on subclasses (which I
#have no idea how they work) so that I can make different schools of
#magic? It is, isn't it...

class Spell
###Attributes###
  #name - getter/setter, string passed to initialize
  #mana - getter/setter, integer passed to initialize
  #result - string passed to initialize or defaults to "fizzle"
  #ingredients - getter, array of strings. Can be passed to initialize
    #or defaults to 'eye of newt'
  attr_reader :ingredients
  attr_accessor :name, :mana

  def initialize ( name, mana_cost, result="The spell fizzles.", *ingredients )
    @name = name
    @mana = mana_cost.to_i
    @result = result
    @ingredients = ingredients
    @ingredients.push("eye of newt") if @ingredients.empty?
  end

###Methods###
  #cast - puts the "result" attribute
  def cast
    p @result
  end

  #change_ingredient - takes a string and adds (if it isn't there) or
    #removes (if it is there) an ingredient from the list. Returns true
    #if adds and false if removes and puts what it does
  def change_ingredient (new_ingredient)
    if @ingredients.include?(new_ingredient)
      @ingredients.delete(new_ingredient)
      false
    else
      @ingredients << new_ingredient
    end
  end

  #research - takes a string (ingredient) and puts something about
    #researching the effect it might have on the spell
  def research (ingredient)
    puts "You look through your spellbooks to see how adding #{ingredient} might make your #{@name} spell more powerful."
  end
end

#fireball = Spell.new("Fireball", 10, "Fwoosh! Holy moly, great balls of fire!", "sprig of holly", "ruby red sand" )
#p fireball.ingredients
#fireball.cast
#fireball.change_ingredient("ruby red sand")
#p fireball.ingredients
#fireball.research("a very hot pepper")
#fireball.change_ingredient("a very hot pepper")
#p fireball.ingredients
spellbook = []
puts "Welcome to Grimoire™, your spell design companion."
puts "To avoid specifying ingredients or a result just enter 'no', 'done', or leave it blank."
puts "Would you like to add a spell?"
loop do
  escapes = ["no", "done", ""]
  break if escapes.include?(gets.chomp)
  puts "What would you like to call your spell?"
  name = gets.chomp
  
  puts "How much mana should your spell cost?"
  mana = gets.chomp.to_i
  while mana == 0
    puts "Nothing is free! Invalid mana cost, make sure you specify some number of units of mana!"
    mana = gets.chomp.to_i
  end

  ingredients = []
  puts "Would you like to specify the ingredients? If so enter them one by one."

  loop do
    ing = gets.chomp
    break if escapes.include?(ing)
    ingredients << ing
    puts "Added #{ing} to the list! Please enter the next ingredient."
  end
  puts "Ok! Your spell will just require eye of newt." if ingredients.empty?

  puts "What effect will your spell have? If you don't enter a result it will fizzle!"
  result = gets.chomp

  spellbook << Spell.new(name, mana, result, *ingredients )
  puts "Ok, added that page to your spellbook! Do you want to add another new spell?"
end
p spellbook