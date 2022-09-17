class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page])
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
   redirect_to admin_user_path(user.id)
  end

  def search
     @users = User.search(params[:search]).page(params[:page])
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:is_active,:profile_image )
  end

end
