class IngredientsController < ApplicationController
  before_action :authenticate

  def index
    hearts = ingredient_params.fetch("base_hearts_recovered", "%" )
    hearts = hearts.to_f unless hearts == "%"
    name = ingredient_params.fetch('name', '%' )
    @ingredients = Ingredient.where("lower(text(base_hearts_recovered)) like ?", hearts).where("lower(text(name)) like ?", "%#{name}%")
    json_response(@ingredients)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    json_response(@ingredient)
  end

  def create
    @ingredient = Ingredient.create!(ingredient_params)
    json_response(@ingredient, :created)
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update!(ingredient_params)
      render status: 200, json: {
        message: "#{@ingredient.name} has successfully been updated."
      }
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      render status: 200, json: {
        message: "#{@ingredient.name} has successfully been destroyed."
      }
    end
  end

  private

  def ingredient_params
    params.permit(:name, :base_hearts_recovered, :token)
  end

end
