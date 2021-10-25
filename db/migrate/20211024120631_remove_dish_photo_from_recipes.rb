class RemoveDishPhotoFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :dish_photo, :string
  end
end
