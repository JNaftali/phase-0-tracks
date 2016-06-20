#Created with kawikathomas, see copy in his repo for proper workflow

def add_to_array(array, *items)
  array + items
end

def build_array(*items)
  items
end

new_array = []
p new_array

new_array.push("item1", "item2", "item3", "item4", "item5")
p new_array

new_array.delete_at(2)
p new_array

new_array.insert(2, "newitem2")
p new_array

new_array.shift
p new_array

p "Does the array contain item1? " + new_array.include?("item1").to_s

second_array = ["red", "blue", "green", "yellow"]

combined_array = new_array + second_array

p combined_array

p build_array("taco", "burrito", "hamburger")

p add_to_array(new_array, "item6")
p add_to_array(second_array, "purple", "orange")