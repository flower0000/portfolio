class FavoritesController < ApplicationController
  
  def create
    @recipe = Recipe.find(params[:id])
    @favorite = Favorite.new

  end
  
  def destroy
    
  end
end
