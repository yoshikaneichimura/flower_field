class Public::PostImagesController < ApplicationController
  def new
      @post_image = PostImage.new
  end

  def index
    @user = current_user
    @post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : PostImage.all

  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new

  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to public_post_images_path
  end

  def update
    post_image = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to public_post_image_path(post_image.id)
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to public_post_images_path
  end

  def search
     @post_images = PostImage.search(params[:search])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:flower,:field,:day,:star,:address,:comment,:image,tag_ids:[], )
  end

end


