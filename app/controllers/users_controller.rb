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

  def search#部分一致による検索(user名)
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
      #name LIKEと書くことでnameカラムを検索、という意味
      #?は次の引数"%#{params[:name]}%"を受け取る場所
      #最終的にはname LIKE "%#{params[:name]}%"となる
      # %文字% は任意の文字列
      #結果としてはnameカラムにparams[:name]を含むレコードを探し出す
      ##{params[:name]}は変数展開

    else
      @users = User.none
    end

    if params[:dish].present?
      @recipes = Recipe.where('name LIKE ?', "%#{params[:dish]}%")

    else
      @recipes = Recipe.none
    end
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
