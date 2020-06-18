class UsersController < ApplicationController
  before_action :if_not_admin

  def show
    @user = current_user
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
