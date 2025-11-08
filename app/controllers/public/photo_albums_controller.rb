class Public::PhotoAlbumsController < ApplicationController
  def index
    @genre = Genre.find(params[:genre_id])
    @posts = @genre.posts
  end

  def show
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
      @genres = [@genre]
    else
      @posts = Post.all
      @genres = Genre.all
    end
  end

  def select_genre
    @genre = Genre.find(params[:id])
    @posts = @genre.posts
  end
end
