class Public::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  #追加したがあっているか？
  def index
    @post = Post.new
    @posts = Post.all
    @post_comment = PostComment.new
    @post_comments = PostComment.all

  def destroy
    post_comment = PostComment.find(params[:id]) 
    post_comment.destroy
    redirect_back(fallback_location: posts_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end



end
