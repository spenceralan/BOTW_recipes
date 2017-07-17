class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    json_response(@ingredients)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    json_response(@ingredient)
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    json_response(@ingredient)
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end

  def ingredient_params
    params.permit(:name, :base_hearts_recovered)
  end

end
