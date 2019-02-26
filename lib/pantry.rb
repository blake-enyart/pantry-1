class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    if !@stock.keys.include?(ingredient)
      0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    enough_of_each = recipe.ingredients.map do |ingredient|
      return false if !@stock[ingredient]
      recipe.amount_required(ingredient) <= @stock[ingredient]
    end
    enough_of_each.all?
  end
end
