class FavoritesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])

    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.recipe_id = @recipe.id
    @favorite.save
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])

    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    @favorite.destroy
    redirect_to recipe_path(@recipe.id)
  end
end
