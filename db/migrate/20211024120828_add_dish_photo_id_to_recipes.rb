class AddDishPhotoIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :dish_photo_id, :string
  end
end
