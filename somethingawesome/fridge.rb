require 'sqlite3'
require 'Date'

# create local pointer to SQLite3 database
db = SQLite3::Database.new("fridge.db")
#db.results_as_hash = true

# Create the table if it doesn't already exist
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS fridge(
    item VARCHAR(255),
    quantity INT,
    purchased INT
  )
SQL
db.execute(create_table_cmd)

#Fridge class
#Variables
  #inventory - reader, array of items in fridge
  #database - pointer to fridge.db no access
#Methods
  #initialize - takes database
  #add - adds item to inventory. Defaults to 1
  #remove - removes item from inventory. Defaults to all of it unless quantity is specified
  #load - sync with database, assuming database is up to date
  #save - sync with database, assuming instance is up to date
  #to_s - prints a list of items and quantities
  #inspect - alias for inventory

#Grocery class
#Mixins - comparable
#Variables
  #name - reader
  #quantity - accessor
  #purchased - reader
#Methods
  #initialize - takes item and quantity, and sets date of purchase
  #to_s - formatted string with all instance variables
  #inspect - returns readable item
  # == - returns true if name and quantity match
  # <=> - compares quantity

class Fridge
  attr_reader :inventory

  def initialize(database)
    @inventory = []
    @db = database
  end

  def add(item, quantity = 1)
    inventory << Grocery.new(item, quantity)
  end

  def remove(item, quantity = true)
     #removes all instances of that item unless quantity is a number
     return @inventory.delete(Grocery.new(item, 1)) unless quantity.class == Fixnum
    #Otherwise starts with the oldest and removes until quantity is used up
    @inventory.each_index do |i|
      grocery = @inventory[i]
      next unless grocery.name == item
      if grocery.quantity > quantity
        grocery.quantity -= quantity
        break
      else
        quantity -= grocery.quantity
        @inventory.delete_at(i)
        break if quantity == 0
      end
    end
    if quantity > 0
      puts "We don't have that many #{item}!"
    end
  end

  def load
    #placeholder - saving complicated for later
  end

  def save
    #placeholder - saving complicated for later
  end

  def to_s
    return "This fridge is empty." if @inventory.empty?

    str = "This fridge contains:"
    @inventory.sort { |x,y| x.name <=> y.name }.each do |grocery| #Sort the items by name
      str << "\n  " << grocery.to_s
    end
    str
  end

  def inspect
    @inventory #Each grocery should properly convert itself to an easily displayed hash object
  end
end

class Grocery
  include Comparable
  attr_reader :name, :purchased
  attr_accessor :quantity

  def initialize(name, quantity)
    @name = name
    @quantity = quantity
    @purchased = Date::today.jd
  end

  def to_s
    "#{@quantity} #{@name}, purchased on #{Date.jd(@purchased)}"
  end

  def inspect
    "#<Grocery: #{@quantity} #{@name}, purchased #{Date.jd(@purchased)}>"
  end

  def == other
    @name == other.name && @quantity == other.quantity
  end

  def <=> other
    #right now 2 eggs < 3 string beans. Would like to figure out how to make that error
    @quantity <=> other.quantity
  end
end

eggs = Grocery.new("eggs", 12)
p eggs
puts eggs

puts "Should be false: " + (eggs == Grocery.new("eggs", 13)).to_s
puts "Should be true: " + (eggs == Grocery.new("eggs", 12)).to_s

puts "Should be true: " + (eggs < Grocery.new("eggs", 13)).to_s

fridge = Fridge.new(db)
fridge.add("eggs", 12)
fridge.add("lettuce", 3)
fridge.add("tomatoes", 5)
fridge.add("milk", 1)
p fridge
puts fridge
fridge.remove("tomatoes", 2)
puts fridge
fridge.remove("lettuce", 5)
puts fridge