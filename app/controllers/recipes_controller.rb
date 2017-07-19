class RecipesController < ApplicationController

  def create

  end

private

  def recipe_params
    params.permit(:name)
  end

end
