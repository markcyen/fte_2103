class Item
  attr_reader :name,
              :price

  def initialize(name:, price:)
    @name = name
    @price = price.gsub(/\D/,'').to_f / 100
  end

end
