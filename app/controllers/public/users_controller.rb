class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all.order(created_at: :desc)
    @users = @users.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to public_user_path(user.id)
  end

  def unsubscribe
    @user = current_user

  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to top_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:is_active,:profile_image )
  end

end
