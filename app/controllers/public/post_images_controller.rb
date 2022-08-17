class Public::PostImagesController < ApplicationController
  def new
      @post_image = PostImage.new
  end

  def index
      @post_images = PostImage.all
      @post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
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

  private

  def post_image_params
    params.require(:post_image).permit(:flower,:field,:day,:star,:address,:comment,tag_ids:[] )
  end

end


