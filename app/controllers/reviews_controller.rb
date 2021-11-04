class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      flash[:notice]="レビューに成功しました"
      redirect_to recipe_path(@review.recipe_id)
    else
      flash[:alert]="レビューに失敗しました"
      redirect_to recipe_path(@review.recipe_id)
    end

  end

  def edit
    @review = Review.find(params[:id])
    @recipe = Recipe.find(@review.recipe_id)
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to recipe_path(@review.recipe_id)
  end

  def destroy
    @review = Review.find(params[:id])
    @recipe = Recipe.find(@review.recipe_id)
    @review.destroy
    redirect_to recipe_path(@recipe.id)
  end

    private

  def review_params
    params.require(:review).permit(:recipe_id, :comment, :score)
  end
end
