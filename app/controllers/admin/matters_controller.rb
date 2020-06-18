class Admin::MattersController < ApplicationController
  before_action :if_not_admin
  before_action :set_matter, only: [:show, :edit, :update, :destroy]

  def index
    @search = Matter.ransack(params[:q])
    @matters = @search.result
  end

  def show
  end

  def edit
  end

  def update
    if @matter.update(matter_params)
      redirect_to admin_matters_path, notice: "#{@matter.title}を編集しました。"
    else
      flash[:alert] = '編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @matter.destroy
    redirect_to admin_matters_path, notice: 'matter was successfully destroyed.'
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def matter_params
    params.require(:matter).permit(:title, :content, :address, :latitude, :longitude, :status, :priority, :start_time, :end_time, :remark, images: [])
  end
  
  def set_matter
     @matter = Matter.find(params[:id])
  end
end
