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

  def initialize(database, table)
    @inventory = []
    @database = database
    @table = table
  end

  def add(grocery)
    return false if grocery.class != Grocery
    inventory << grocery
  end

  def remove(item, quantity = true)
     #removes all instances of that item unless quantity is a number
     return @inventory.delete(Grocery.new(item, 1)) unless quantity.class == Fixnum
    #Otherwise starts with the oldest and removes until quantity is used up
    i = 0
    while i < @inventory.length do
      grocery = @inventory[i]
      grocery.quantity = grocery.quantity.to_i
      unless grocery.name == item
        i += 1
        next
      end
      if grocery.quantity > quantity
        @inventory[i].quantity -= quantity
        quantity = 0
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
    @inventory = []
    @database.execute("SELECT * FROM #{@table}") do |row|
      add(Grocery.new(*row))
    end
  end

  def save
    @database.execute("DELETE FROM #{@table}")
    return false if @inventory.empty?
    str = "INSERT INTO #{@table} (item, quantity, purchased) VALUES"
    @inventory.each do |grocery|
      str << "('#{grocery.name}', #{grocery.quantity}, #{grocery.purchased}), "
    end
    #execute str without the last ", "
    @database.execute(str[0...-2])
    true
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

  def initialize(name, quantity = 1, purchased = Date::today.jd)
    @name = name
    @quantity = quantity
    @purchased = purchased
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