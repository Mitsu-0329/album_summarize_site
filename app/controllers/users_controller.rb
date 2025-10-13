class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    # ここから追加
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    # ここまで追加
    @user = User.find(params[:id])
  end

  def update
    # ここから追加
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    # ここまで追加
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end  
  
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
