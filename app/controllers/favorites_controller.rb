class FavoritesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    #URLでは:idではなく:recipe_idでid情報は受け渡されるのでこのような表記になる。
    #ルーティングのURLは必ず確認すること

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
