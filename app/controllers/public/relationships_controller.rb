class Public::RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:format])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:format])
    @user = User.find(params[:format])
    @users = user.followings
  end

  def followers
    user = User.find(params[:format])
    @user = User.find(params[:format])
    @users = user.followers
  end
end
