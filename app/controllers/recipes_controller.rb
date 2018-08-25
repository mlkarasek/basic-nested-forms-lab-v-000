class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(title:)
    @recipe.ingredients.build(ingredients:)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(
    :title, 
    ingredients_attributes: [
      :name,
      :quantity
    ])
  end
end 
