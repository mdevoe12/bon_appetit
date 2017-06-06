require 'pry'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/recipe'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new

    @r      = Recipe.new("Spicy Cheese Pizza")
    @r.add_ingredient("Cayenne Pepper", 0.025)
    @r.add_ingredient("Cheese", 75)
    @r.add_ingredient("Flour", 500)
  end

  def test_it_creates_class

    assert_instance_of Pantry, @pantry
  end

  def test_if_stock_is_default_hash
    actual   = @pantry.stock
    expected = {}

    assert_equal expected, actual
  end

  def test_if_stock_check_returns_zero
    actual   = @pantry.stock_check("Cheese")
    expected = 0

    assert_equal expected, actual
  end

  def test_if_restock_returns_ten
    @pantry.restock("Cheese", 10)
    actual = @pantry.stock_check("Cheese")
    expected = 10

    assert_equal expected, actual
  end

  def test_if_restock_works_twice
    @pantry.restock("Cheese", 10)
    @pantry.restock("Cheese", 20)
    actual = @pantry.stock_check("Cheese")
    expected = 30

    assert_equal expected, actual
  end

  def test_if_spicycheesepizza_creates

    assert_instance_of Recipe, @r
  end

  def test_if_number_converstion_works
    actual_1 = @pantry.conversion(0.025)
    expected_1 = 25
    actual_2 = @pantry.conversion(75)
    expected_2 = 75
    actual_3 = @pantry.conversion(500)
    expected_3 = 5

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
    assert_equal expected_3, actual_3
  end

  def test_if_unit_converstion_works
    actual_1 = @pantry.find_unit_type(0.025)
    expected_1 = "Milli-Units"
    actual_2 = @pantry.find_unit_type(75)
    expected_2 = "Universal Units"
    actual_3 = @pantry.find_unit_type(500)
    expected_3 = "Centi-Units"

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
    assert_equal expected_3, actual_3
  end

  def test_if_convert_units_works
    actual = @pantry.convert_units(@r)
    expected = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
                "Cheese"         => {quantity: 75, units: "Universal Units"},
                "Flour"          => {quantity: 5, units: "Centi-Units"}}

    assert_equal expected, actual
  end

end
