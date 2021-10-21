class AddDishToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :dish, :string
  end
end
