class Public::PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to public_post_image_path(post_image)
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_image = post_comment.post_image
    post_comment.destroy
    redirect_to public_post_image_path(post_image)

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
