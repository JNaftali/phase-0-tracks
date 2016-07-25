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


quitwords = ["q", "quit", "done", "stop", "no", "exit"]

puts "Welcome to the shopping list manager."
loop do
  puts "What would you like to do? You can type 'new' to make a new list, 'template' to edit the standard shopping list (which is used as the starting point for all other shopping lists), 'edit' or 'delete' an existing list, or 'list' to show a list of lists - so meta! Or of course 'quit' to quit"
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
  when "add", "new"
  when "edit", "change"
  when "remove", "delete"
  end
end