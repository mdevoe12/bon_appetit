require 'pry'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
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

  end

end
