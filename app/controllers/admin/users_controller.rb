class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "#{@user.name}を編集しました。"
    else
      flash[:alert] = '編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "#{@user.name}を削除しました。"
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :user_image, :phone_number, :user_place, :remark, :icon, :admin)
  end
end
