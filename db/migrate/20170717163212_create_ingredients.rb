class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"
    create_table :ingredients, id: :uuid do |t|
      t.column :name, :string
      t.column :buff, :string
      
      t.timestamps
    end
  end
end
