class Admin::GroupsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
      redirect_to edit_admin_groups_path(@group)
  end


  def family_index
    @users = User.all
  end

  def index
    @users = User.all
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path
  end

  private
    def group_params
      params.require(:group).permit(:name, :image, :introduction, :family_code)
    end

end
