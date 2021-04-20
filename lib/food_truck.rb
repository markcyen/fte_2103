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

  def stock(item, number)
    if @inventory[item].nil?
      @inventory[item] = number
    else
      @inventory[item] += number
    end
  end
end
