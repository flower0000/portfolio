class UsersController < ApplicationController
  def show#マイページ用
    @user = current_user
    @recipes = current_user.recipes#ログインユーザーの全投稿レシピ取得
  end

  def other_user#他のユーザーのマイページ用
    @user = User.find(params[:id])
    @recipes = @user.recipes#他ユーザー投稿レシピを全て取得
  end

  def index
    @users = User.all
  end


  def edit
    @user = current_user
  end

  def update
    user = User.find_by(email: current_user.email)
    user.update(user_params)
    redirect_to mypage_path
  end

  def check

  end

  def withdrawal
    @user = current_user
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
