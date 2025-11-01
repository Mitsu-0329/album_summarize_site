class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @new_post = Post.new
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

  def destroy
    @user = User.find(params[:id])  # データ（レコード）を1件取得
    @user.destroy  # データ（レコード）を削除
    redirect_to '/users/sign_up'  # TOP画面へリダイレクト 
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :family_code)
  end


end
