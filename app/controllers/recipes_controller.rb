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
    @review = Review.new

    #詳細画面で該当するレビューをすべて表示させる
    @reviews = Review.where(recipe_id: @recipe.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
     #recipeとアソシエーションを組んでいるhow_to_makeやrecipe_ingredientsのデータもrecipe_paramsに含まれているため一緒に紐づいているデータも含めて更新される。

    #updateももし一つずつデータを更新するなら↓↓↓こうも書ける
    # @recipe.time = params[:recipe][:time]
    # @recipe.money = params[:recipe][:money]
    # @recipe.dish_photo_id = params[:recipe][:dish_photo_id]
    # @recipe.recipe_ingredients.find(params[:recipe][:recipe_ingredients_attributes][0][:id]).material = params[:recipe][:recipe_ingredients_attributes][0][:material]
    # @recipe.recipe_ingredients.find(params[:recipe][:recipe_ingredients_attributes][0][:id]).quantity = params[:recipe][:recipe_ingredients_attributes][0][:quantity]
    # @recipe.recipe_ingredients.find(params[:recipe][:recipe_ingredients_attributes][0][:id]).material = params[:recipe][:recipe_ingredients_attributes][0][:material]
    # @recipe.recipe_ingredients.find(params[:recipe][:recipe_ingredients_attributes][0][:id]).quantity = params[:recipe][:recipe_ingredients_attributes][0][:quantity]
    # @recipe.update
    #ここまで。ただし，recipe_ingredientsやhow_to_makesの記入数が固定されてしまうので現実的ではない。

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
                                  recipe_ingredients_attributes:[:id, :material, :quantity, :_destroy],
                                  how_to_makes_attributes:[:id, :introduction, :order_no, :_destroy])
  end
end

#recipe_ingredients_attributes:の記述の仕方
#recipeモデルアソシエーションが複数ならrecipe_ingredients(複数形)で記述．_attributesはいつでも複数形。
#:idもrecipe_ingredientのデータを，どのデータで上書きしたらいいか判断するために必要
#:_destroyは削除用のボタンの
