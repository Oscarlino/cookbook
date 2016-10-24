require_relative "recipe"
require "csv"
class Cookbook
  attr_reader :recipe_list

  def initialize(csv_file)
    @recipe_list = []
    @csv_file = csv_file
    CSV.foreach(csv_file) do |recipe|
      add_recipe(recipe)
    end
  end

  def add_recipe(recipe)
    @recipe_list << recipe
    right_csv
  end

  def right_csv
    CSV.open(@csv_file, "wb") do |csv|
      @recipe_list.each do |recipe|
        if recipe.is_a?Array
          csv << recipe
        else
          csv << [recipe.name, recipe.description]
        end
      end
    end
  end

  def remove_recipe(recipe_id)
    @recipe_list.delete_at(recipe_id)
    right_csv
  end

  def all
    @recipe_list.map do |recipe|
      if recipe.is_a?Array
        Recipe.new(recipe[0], recipe[1])
      else
        recipe
      end
    end
  end
end

