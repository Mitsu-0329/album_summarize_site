class Public::GroupUsersController < ApplicationController
  before_action :set_group

  def create
    # group_usersテーブルに新しいレコードを作成
    @group_user = @group.group_users.new(user_id: params[:user_id])

    if @group_user.save
      redirect_to @group, notice: 'メンバーを追加しました。'
    else
      redirect_to @group, alart: 'メンバーの追加に失敗しました。'
    end
  end

  def destroy
    # 中間テーブルから削除
    @group_user = @group.group_users.find_by(user_id params[:id])
    @group_user.destroy
    redirect_to @group, notice: 'メンバーを削除しました。'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

end
