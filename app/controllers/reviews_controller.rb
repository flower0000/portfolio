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

  end


  def destroy

  end

    private

  def review_params
    params.require(:review).permit(:recipe_id, :comment, :score)
  end
end
