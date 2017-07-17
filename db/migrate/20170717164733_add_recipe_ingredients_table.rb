class AddRecipeIngredientsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients, id: :uuid do |t|
      t.column :ingredient_id, :uuid
      t.column :recipe_id, :uuid

      t.timestamps
    end
  end
end
