require 'sqlite3'
require 'date'
require_relative 'fridge'

describe Grocery do
  let(:groceries) {Grocery.new('eggs', 12)}

  it "allows the proper instance variables to be accessed and changed" do
    expect(groceries.name).to eq("eggs")
    expect(groceries.quantity).to eq(12)
    expect(groceries.purchased).to eq(Date::today.jd)
    groceries.quantity = 8
    expect(groceries.quantity).to eq(8)
  end

  it "properly compares two instances" do
    expect(groceries == Grocery.new('eggs', 12)).to be true
    expect(groceries == Grocery.new('eggs', 13)).to be false
    expect(groceries < Grocery.new('eggs', 13)).to be true
  end

  it "stringifies properly" do
    expect(groceries.to_s).to eq("12 eggs, purchased on #{Date::today}")
  end

  it "displays properly" do
    expect(groceries.inspect).to eq("#<Grocery: 12 eggs, purchased #{Date::today}>")
  end
end

describe Fridge do
  before(:all) do
    @fridge = Fridge.new("placeholder")
    @fridge.add(Grocery.new("eggs", 12))
    @fridge.add(Grocery.new("lettuce", 3))
    @fridge.add(Grocery.new("lettuce", 7))
    @fridge.add(Grocery.new("tomatoes", 5))
    @fridge.add(Grocery.new("milk", 1))
  end

  it "initializes properly" do
    expect(@fridge.class).to eq(Fridge)
  end

  it "stores added grocery items correctly." do
    expect(@fridge.inventory).to eq([Grocery.new('eggs',12), Grocery.new('lettuce',3), Grocery.new("lettuce", 7), Grocery.new('tomatoes',5), Grocery.new('milk',1)])
  end

  it "removes items correctly" do
    @fridge.remove('lettuce',5)
    expect(@fridge.inventory).to eq([Grocery.new('eggs',12), Grocery.new("lettuce", 5), Grocery.new('tomatoes',5), Grocery.new('milk',1)])
  end

  it "converts properly to a string" do
    expect(Fridge.new("placeholder").to_s).to eq("This fridge is empty.")

    str = "This fridge contains:\n  12 eggs, purchased on #{Date::today}\n  5 lettuce, purchased on #{Date::today}\n  1 milk, purchased on #{Date::today}\n  5 tomatoes, purchased on #{Date::today}"
    expect(@fridge.to_s).to eq(str)
  end

  it "inspects properly" do
    expect(@fridge.inspect).to eq(@fridge.inventory)
  end
end