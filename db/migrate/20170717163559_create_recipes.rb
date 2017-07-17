class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
