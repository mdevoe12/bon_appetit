require 'pry'
class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    @stock.has_key?(item) == true ? (qty = (@stock.values_at(item)).join) : (0)
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
      converted_items.store(ingredient, conversion(amount))
    end
    converted_items
  end


  def conversion(amount)
    entry = {}
    if amount > 100
      entry = {quantity: (amount/100), units: "Centi-Units"}
    elsif amount < 1.00
      entry = {quantity: ((amount * 1000).to_i), units: "Milli-Units"}
    else
      entry = {quantity: amount, units: "Universal Units"}
    end
    entry
  end

end
