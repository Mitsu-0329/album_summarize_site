class Public::GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  #グループ作成データの保存
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if@group.save
      redirect_to group_path(@group.id)
    else
      render :new
    end
  end


  def edit
    @group = Group.find(params[:id])
    # ここから追加
    
    unless @group.owner_id == current_user.id
      redirect_to groups_family_index_path
    end
    # ここまで追加
  end

  def update
    @group = Group.find(params[:id])
    # ここから追加
    
    unless @group.owner_id == current_user.id
      redirect_to groups_family_index_path
      return
    end
    @group.update(group_params)
      redirect_to group_path(@group)

  end



  def family_index
    @users = User.all
  end

  def show
    @group = Group.find(params[:id])
  end


  #投稿データのストロングパラメータ
  private

  def group_params
    params.require(:group).permit(:name, :image, :introduction, :family_code)
  end


end
