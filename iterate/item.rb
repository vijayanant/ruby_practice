class Item

  attr_accessor :cost

  def initialize
    @cost = 0
  end

  def <=> other
    self.cost <=> other.cost
  end

  def to_s
    "{ cost: #{@cost} }"
  end
end
