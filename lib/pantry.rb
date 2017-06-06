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
    ingredients = recipe.ingredients
    new_hash = {}
    ingredients.each do |ingredient, amount|
      converted = conversion(amount)
      units = find_unit_type(amount)
      new_hash.store(ingredient, {quantity: converted, units: units})
    end
    new_hash
  end

  def find_unit_type(amount)
    if amount > 100
      "Centi-Units"
    elsif amount < 1.00
      "Milli-Units"
    else
      "Universal Units"
    end
  end

  def conversion(amount)
    if amount > 100
      amount/100
    elsif amount < 1.00
      (amount * 1000).to_i
    else
      amount
    end
  end

end
