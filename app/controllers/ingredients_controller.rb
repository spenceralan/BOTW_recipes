class IngredientsController < ApplicationController
  include Sequelize
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  def index
    ingredient_params.each_pair do |k, v|
      query = build_query(k, v)
      @ingredients = Ingredient.where("#{query[0]}", "#{query[1]}")
    end
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
    params.permit(:name, :base_hearts_recovered)
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end

end
