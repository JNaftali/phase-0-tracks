# Method to add an item to a list
# input: item name and optional quantity
# steps: grocery_list[item] = number
# output: updated hash

def add_item(hash, item, number=1)
  hash[item] = number
  hash
end

# Method to print a list and make it look pretty
# input: none
# steps:
  # print list header
  # loop through list and print item - quantity
# output: none - just pretty puts

def print_list(hash)
  puts "These are the items on your grocery list:"
  hash.each do |item, number|
    puts "#{item}, qty: #{number}"
  end
end

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # make empty hash 'grocery_list'
  # split string with " " as a separator
  # use method add_item on each word
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: hash


def create_list(string="")
  grocery_list = {}
  string.split.each do |item|
    add_item(grocery_list, item)
  end
  print_list(grocery_list)
end


# Method to remove an item from the list
# input: item name
# steps: grocery_list.delete(item)
# output: updated hash

def remove_item(hash, item)
  hash.delete(item)
  hash
end


# Method to update the quantity of an item
# input: item name, quantity
# steps: grocery_list[item] = number
# output: updated hash

def update_quantity(hash, item, number)
  hash[item] = number
  hash
end


# TEST CODE
# Create a new list
test_list = create_list

# Add the following items to your list
# Lemonade, qty: 2
add_item(test_list, "lemonade", 2)
# Tomatoes, qty: 3
add_item(test_list, "tomatoes", 3)
# Onions, qty: 1
add_item(test_list, "onions")
# Ice Cream, qty: 4
add_item(test_list, "ice cream", 4)

# Remove the Lemonade from your list
remove_item(test_list, "lemonade")

# Update the Ice Cream quantity to 1
update_quantity(test_list, "ice cream", 1)

# Print out your list (Is this readable and nice looking)?

print_list(test_list)