require 'sqlite3'

# create local pointer to SQLite3 database
db = SQLite3::Database.new("fridge.db")
#db.results_as_hash = true

# Create the table if it doesn't already exist
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS fridge(  #no primary key needed: YOU'RE NOT SPECIAL, EGGS!
    item VARCHAR(255),                #eggs
    quantity INT,                     #2 dozen
    purchased REAL                    #date item was purchased. Format is Julian, user never sees until it's converted
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
  #initialize - takes item, quantity, and date of purchase
  #to_s - @quantity @name
  #inspect - returns item as a hash with symbol keys name, quantity, and purchased
  # == - returns true if name and quantity match
  # <=> - compares quantity

class Fridge
  attr_reader inventory

  def initialize(database)
    @inventory = []
    @database = database
  end

  def add(item, quantity = 1)
    inventory << Grocery.new(item, quantity)
  end

  def remove(item, quantity = true)
     #removes all instances of that item unless quantity is a number
     return @inventory.delete(Grocery.new(item, 1)) unless quantity.class == 'Integer'

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
  end

  def load
    #placeholder - saving complicated for later
  end

  def save
    #placeholder - saving complicated for later
  end

  def to_s
    return "This fridge is empty." if @inventory.empty?

    str = "This fridge contains:\n"
    @inventory.sort { |x,y| x.name <=> y.name }.each do |grocery| #Sort the items by name
      str.concat(grocery) << "\n" #the grocery item's own to_s method should format this correctly
    end
  end
end