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

fridge = Fridge.new(db)
fridge.load

quitwords = ["q", "quit", "done", "stop", "no", "exit"]

puts "Welcome to fridgetracker. Right now, this is what we see in your fridge:"
puts fridge
loop do
  puts "What would you like to do now?"
  response = gets.chomp
  case response

  when *quitwords
    puts "Ok, goodbye!"
    fridge.save
    break

  when "list"
    puts "This is what I I have a record of seeing in your fridge."
    puts fridge

  when "add", "new", "put in"
    loop do
      puts "What would you like to put in your fridge?"
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
      puts "Putting #{quantity} #{item} into your fridge."
      fridge.add(Grocery.new(item, quantity))
      puts "Ok, next item. Type 'done' or 'quit' to finish."
    end

  when "remove", "delete", "take out"
    loop do
      puts "What would you like to remove from your fridge?"
      response = gets.chomp
      case response
      when *quitwords
        puts "Ok, done removing things"
        break
      when /(\d+) ((?:\w+ ?)+)/
        item = $2
        quantity = $1.to_i
      when /(?:[a-zA-Z]+ ?)+/
        item = response
        puts "How many #{item} are you taking out of your fridge?"
        quantity = gets.chomp.to_i
      else
        puts "Sorry, I didn't get that."
        redo
      end
      puts "Removing #{quantity} #{item} from your fridge."
      fridge.remove(item, quantity)
      puts fridge
      puts "Ok, next item. Type 'done' or 'quit' to finish."
    end
  end
end