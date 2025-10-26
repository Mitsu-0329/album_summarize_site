class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  #投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if@post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end


  def index
    #@posts = Post.page(params[:page])
    @post = Post.new
    @user = current_user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    
  end

  def edit
    @post = Post.find(params[:id])
    # ここから追加
    user = @post.user
    unless user.id == current_user.id
      redirect_to posts_path
    end
    # ここまで追加
  end

  def update
    # ここから追加
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
    # ここまで追加
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have updated post successfully."
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      render :edit
    end

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
