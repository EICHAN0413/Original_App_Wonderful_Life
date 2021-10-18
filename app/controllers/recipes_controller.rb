class RecipesController < ApplicationController
  def index
    recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
  end
end
