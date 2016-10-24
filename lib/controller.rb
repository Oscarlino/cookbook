
require_relative "cookbook"
require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = RecipeView.new
  end

  def list
    @view.show_recipies(@cookbook)
  end

  def create
    recipe = @view.add_a_recipe
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    recipe_id = @view.delete_a_recipe
    @cookbook.remove_recipe(recipe_id)
  end
end

