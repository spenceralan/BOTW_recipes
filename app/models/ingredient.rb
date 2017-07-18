class Ingredient < ApplicationRecord
  validates_numericality_of :base_hearts_recovered

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
