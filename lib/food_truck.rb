class FoodTruck
  attr_reader :name,
              :inventory,
              :incremental_amount

  def initialize(name)
    @name = name
    @inventory = Hash.new { |hash, key| hash[key] = 0 }
    @incremental_amount = 0
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] = amount
    @incremental_amount += amount
    @inventory[item] = @incremental_amount
  end
end
