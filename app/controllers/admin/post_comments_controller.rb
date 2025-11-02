class Admin::PostCommentsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @post = Post.all
    @post_comments = PostComment.all
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
    redirect_to admin_post_comments_path
  end

  def destroy_all
  end
end
