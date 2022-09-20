class Admin::PostImagesController < ApplicationController

  before_action :authenticate_admin!
  def index
    @post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : PostImage.all.order(created_at: :desc)
    @post_images = @post_images.page(params[:page]).per(10)
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if  @post_image.update(post_image_params)
        flash[:notice] = "投稿内容を編集しました"
        redirect_to admin_post_image_path(@post_image.id)
    else
        render :edit
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to admin_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:flower,:field,:day,:star,:address,:comment,:image,tag_ids:[], )
  end


end
