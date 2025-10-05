class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  #投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if@post.save
      redirect_to post_path
    else
      render :new
    end
  end


  def index
    @posts = Post.page(params[:page])
  end

  def show
  end

  def edit
  end
end
