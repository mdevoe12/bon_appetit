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
      if stock_check(item) == 0
        @stock.store(item, quantity)
      else
        @stock.store(item, ((stock_check(item)) + quantity))
      end
  end

  def convert_units(recipe)
    ingredients = recipe.ingredients
    create_converted_hash(ingredients)
  end

  def create_converted_hash(ingredients)
    converted_items = {}
    ingredients.each do |ingredient, amount|
      converted = conversion(amount)
      units = find_unit_type(amount)
      converted_items.store(ingredient, {quantity: converted, units: units})
    end
    converted_items
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
