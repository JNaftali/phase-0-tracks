require 'date'
require 'sqlite3'
require_relative 'fridge'

db = SQLite3::Database.new("fridge.db")
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS fridge(
    item VARCHAR(255),
    quantity INT,
    purchased INT
  )
SQL
db.execute(create_table_cmd)

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS template(
    item VARCHAR(255),
    quantity INT,
    purchased INT
  )
SQL
db.execute(create_table_cmd)

get_tables_cmd = <<-SQL
  SELECT name FROM sqlite_master
  WHERE type='table'
  ORDER BY name
SQL

lists = db.execute(get_tables_cmd).flatten
library = Hash.new { |hash, key| hash[key] = Fridge.new(db,key) }
lists.each { |table| library[table].load }


quitwords = ["q", "quit", "done", "stop", "no", "exit", "n"]
yeswords = ["y","yes"]

puts "Welcome to the shopping list manager."
loop do
  puts "What would you like to do? You can make a 'new' list, edit the 'template' shopping list (which is used as the starting point for all other shopping lists), 'edit' or 'delete' an existing list, or 'list' to show a list of lists - so meta! Or of course 'quit' to quit"
  response = gets.chomp
  case response

  when *quitwords
    library.each { |_,table| table.save }
    puts "Ok, goodbye!"
    break

  when "list"
    puts "\nYou have the following lists:"
    library.each { |k,v| puts "#{k.capitalize} - #{v}"}
    puts
  when "template"
    puts "What would you like to add"

  when "add", "new", "edit", "change"
    loop do
      puts "What is the name of the list you want to add/edit?"
      name = gets.chomp
      if name == "fridge" || name == "template"
        puts "Sorry, that name is reserved."
        next
      elsif library.keys.contains?(name)
        puts "Adding new list '#{name}'. Would you like to start by comparing the template to what's in the fridge?"
        response = gets.chomp
        case response
        when *yeswords
          newlist = library[name]
          fridge = library.fridge
          template = library.template
          puts "Parsing template..."

          template.inventory.each do |grocery|
            if fridge.count(grocery.name) < grocery.quantity
              newlist.add(Grocery.new(grocery.name, grocery.quantity - fridge.count(grocery.name)))
            end
          end

          puts("Ok! '#{name}' now contains the following because they were missing from your fridge: #{newlist}")
        when *quitwords
          puts "Ok, starting with a blank list."
        end

        loop do
          puts "What would you like to add to your list?"
          response = gets.chomp
          case response
          when *quitwords
            puts "Ok, done adding things"
            break
          when /(\d+) ((?:\w+ ?)+)/
            item = $2
            quantity = $1
          when /(?:[a-zA-Z]+ ?)+/
            item = response
            puts "How many #{item} are you putting in your fridge?"
            quantity = gets.chomp.to_i
          else
            puts "Sorry, I didn't get that."
            redo
          end
          puts "Adding #{quantity} #{item} to your list."
          fridge.add(Grocery.new(item, quantity))
          puts "Ok, next item. Type 'done' or 'quit' to finish."
        end
        break
      end
    end

  when "remove", "delete"

  end
end