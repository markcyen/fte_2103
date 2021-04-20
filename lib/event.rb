class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_truck_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  # def total_inventory
  #   items_hash = Hash.new { |hash, key| hash[key] = {} }
  #   @food_trucks.each do |food_truck|
  #     food_truck.each do |inventory|
  #       inventory.items
  # end

  # def overstocked_items
  #   @food_trucks.find_all do |food_truck|
  #     food_truck.inventory.sum do |value|
  #       inventory.value > 50
  #     end
  #   end
  # end
end
