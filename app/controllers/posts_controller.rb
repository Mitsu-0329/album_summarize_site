class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  #投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if@post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def destroy
    post = Post.find(params[:id]) 
    post.destroy
    redirect_to posts_path
  end

  #投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :post_image, :body, :genre_id)
  end

end
