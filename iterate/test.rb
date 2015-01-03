require './inventory'
require './item'

class Test
  def initialize
    @inventory = Inventory.new
  end


  def run
    item1 = Item.new
    item1.cost = 10;
    item2 = Item.new
    item2.cost = 20;

    @inventory.add item1
    @inventory.add item2

    @inventory.each.with_index { |item, index| puts "Iterating over Item#{index} #{item} \n" }
  end

  puts "Initialized \n"
  t = Test.new
  puts "Starting Tests\n"
  t.run
  puts "Finished running tests \n"
end
