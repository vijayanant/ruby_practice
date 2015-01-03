class Inventory
  include Enumerable
  attr_reader :items

  def initialize
    @items = []
  end

  def each &block 
    @items.each &block
  end

  def add item 
    @items << item
  end
end
