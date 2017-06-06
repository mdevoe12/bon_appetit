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
    current_count = stock_check(item)
      if current_count == 0
        @stock.store(item, quantity)
      else
        @stock.store(item, (current_count + quantity))
      end
  end


end
