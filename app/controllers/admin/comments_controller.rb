class Admin::CommentsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
  end

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end


  def destroy
  end

  def destroy_all
  end
end
