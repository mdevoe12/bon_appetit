require 'pry'
class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    qty = 0
    @stock.find do |stock_item|
      if stock_item[0] == item
        qty = @stock.values_at(item)
        qty = qty.join
      end
    end
    qty.to_i
  end

  def restock(item, quantity)
    @stock.store(item, quantity)
  end

end
