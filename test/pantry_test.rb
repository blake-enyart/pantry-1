require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)

    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @pantry = Pantry.new
  end

  def test_it_exist

    assert_instance_of Pantry, @pantry
  end

  def test_attr_return_correctly
    expected = {}

    assert_equal expected, @pantry.stock
  end

  def test_stock_check_returns_correctly

    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_restock_behaves_correctly

    assert_equal 0, @pantry.stock_check(@cheese)

    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_returns_correctly
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
