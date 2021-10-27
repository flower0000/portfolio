class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build #親モデル.子モデル.buildで子モデルのインスタンス作成(.newで、子モデル用に作成する感じ)
    @how_to_makes = @recipe.how_to_makes.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #recipe_ingredientsとhow_to_makesはviewで記述はないが他のモデルのパラメータを同時に保存できている
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      @recipe = Recipe.new
      @recipe_ingredients = @recipe.recipe_ingredients.build
      @how_to_makes = @recipe.how_to_makes.build
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to mypage_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :time, :money, :dish_photo_id, :dish,
                                  recipe_ingredients_attributes:[:material, :quantity, :_destroy],
                                  how_to_makes_attributes:[:introduction, :order_no, :_destroy])
  end
end
