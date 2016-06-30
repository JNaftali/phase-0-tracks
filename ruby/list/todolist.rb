class TodoList
  attr_reader :get_items

  def initialize ( array )
    @get_items = array
  end

  def add_item(item)
    @get_items << item 
  end

  def delete_item ( item )
    @get_items.delete(item)
  end

  def get_item ( index )
    @get_items[index]
  end
end