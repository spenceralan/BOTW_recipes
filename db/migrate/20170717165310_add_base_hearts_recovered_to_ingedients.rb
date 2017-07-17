class AddBaseHeartsRecoveredToIngedients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :base_hearts_recovered, :decimal
  end
end
