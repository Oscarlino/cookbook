class RecipeView
  def show_recipies(cookbook)
    print cookbook.recipe_list
  end

  def add_a_recipe
    puts "What's the name of your recipe ?"
    name = gets.chomp
    puts "What the description of your recipe ?"
    description = gets.chomp
    return [name, description]
  end

  def delete_a_recipe
    puts "Which recipe do you want to delete ?"
    return gets.chomp
  end
end
