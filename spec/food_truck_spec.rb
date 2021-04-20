require 'rspec'
require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
  context '#initialize' do
    it 'exists' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_instance_of(FoodTruck)
    end

    it 'has attributes' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end
  end

  context '#check_stock' do
    it 'check stock for an item' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end

  context '#stock' do
    it 'stock item and check for stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq(30)
    end

    it 'stock item and check for incremental add to stock' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq(30)

      expected_1 = {
        item1 => 30
      }
      expect(food_truck.inventory).to eq(expected_1)

      food_truck.stock(item1, 25)
      expect(food_truck.check_stock(item1)).to eq(55)

      food_truck.stock(item2, 12)
      expected_2 = {
        item1 => 55,
        item2 => 12
      }
      expect(food_truck.inventory).to eq(expected_2)

    end
  end
end
