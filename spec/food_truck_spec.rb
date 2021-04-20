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
end
