class Public::PostImagesController < ApplicationController

  before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def index
    @user = current_user
    @post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : PostImage.all.order(created_at: :desc)
    @post_images = @post_images.page(params[:page]).per(10)

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
    if  @post_image.save
        flash[:notice] = "投稿しました"
        redirect_to public_post_images_path
    else
        render :new
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    if  @post_image.update(post_image_params)
        flash[:notice] = "投稿内容を編集しました"
        redirect_to public_post_image_path(@post_image.id)
    else
        render :edit
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to public_post_images_path
  end

  def search
    @post_images = PostImage.search(params[:search]).page(params[:page])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:flower,:field,:day,:star,:address,:comment,:image, :tag_id )
  end

end




