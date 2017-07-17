class IngredientsController < ApplicationController

  def index
    @ingredients = { "ingredient": "radish" }
    json_response(@ingredients)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end

end
