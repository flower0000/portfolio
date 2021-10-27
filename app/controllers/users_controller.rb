class UsersController < ApplicationController
  def show
    @user = current_user
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
