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

  def convert_units(recipe)
    find_and_convert(recipe.ingredients)
    # conversion(recipe.ingredients) #method for actual converstion
    new_hash = {}
    ingredients.each do |ingredient, amount|
      new_hash.store(ingredient, {quantity: amount, units: "units_used"})
    end
  end

  def find_and_convert(ingredients)
    binding.pry
    ingredients.each do |ingredient, amount|
      conversion(amount)
    end
  end

  def conversion(amount)
    if amount > 100
      amount/100
    elsif amount < 1.00
      amount * 1000
    else
      amount
    end
  end


end
