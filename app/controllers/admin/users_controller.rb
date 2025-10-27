class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:successs] = "削除しました"
    redirect_to admin_users_path
  end
end
