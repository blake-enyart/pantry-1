require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exist

    assert_instance_of Recipe, @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_attr_return_correctly

    assert_equal "Mac and Cheese", @mac_and_cheese.name

    expected = {}

    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_add_ingredient_correctly_adds_to_ivar
    expected = {}

    assert_equal expected, @mac_and_cheese.ingredients_required

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = { @cheese => 2, @mac => 8 }

    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_amount_required_returns_correctly
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_ingredients_returns_correctly
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = [@cheese, @mac]

    assert_equal expected, @mac_and_cheese.ingredients
  end

  def test_total_calories_returns_correctly
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 440, @mac_and_cheese.total_calories
  end
end
