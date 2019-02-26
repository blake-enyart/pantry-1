class CookBook

  attr_reader :recipe_list

  def initialize
    @recipe_list = []
  end

  def add_recipe(recipe)
    @recipe_list << recipe
  end

  def summary
    @recipe_list.map do |recipe|
      { name: recipe.name,
        details: { ingredients: hash_generator(ingredient_sort(recipe), recipe),
        total_calories: recipe.total_calories }
      }
    end
  end

  def ingredient_sort(recipe)
    hash = recipe.ingredients_required.inject({}) do
      |total_calories_hash, (ingredient, amount)|
      total_calories_hash[ingredient] = (ingredient.calories * amount)
      total_calories_hash
    end
    ingredients_by_total_cal = hash.sort_by do |ingredient, total_calories|
      total_calories
    end.reverse!
    ingredients_by_total_cal.map { |ingredient_cal| ingredient_cal[0] }.flatten
  end

  def hash_generator(ingredient_sort, recipe)
    ingredient_sort.map do |ingredient|
      { ingredient: ingredient.name,
        amount:
        "#{recipe.ingredients_required[ingredient].to_s} #{ingredient.unit}"
      }
    end
  end
end
