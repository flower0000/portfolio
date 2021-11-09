class RelationshipsController < ApplicationController
  def create
    #follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow = Relationship.new
    follow.following_id = current_user.id
    follow.follower_id = params[:user_id]
    follow.save
    redirect_to other_user_path(follow.follower_id)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    #フォロー解除後にページを遷移したくないため
    @user = User.find_by(params[:user_id])
    redirect_to other_user_path(@user.id)
  end
end
