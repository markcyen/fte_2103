class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new { |hash, key| hash[key] = 0 }
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

  def potential_revenue
    @inventory.sum do |item, number|
      item.price * number
    end
  end
end
