class Admin::CommentsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @post = 
    @post_comments = 
  end

  def destroy
  end

  def destroy_all
  end
end
