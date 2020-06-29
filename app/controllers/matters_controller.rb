class MattersController < ApplicationController
  before_action :set_matter, only: [:show, :edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]

  def index
    @search = Matter.ransack(params[:q])
    @matters = @search.result.page(params[:page])
    @matters = @matters.order(created_at: :desc)

    @informations = Information.all
    @information = Information.new

    @notifications = current_user.passive_notifications
  end

  def show
    @favorite = current_user.favorites.find_by(matter_id: @matter.id)
    if @matter.latest_sender != current_user.name && (@matter.user_id == current_user.id || current_user.admin == true)
      @matter.latest_sender = nil
      @matter.save
    end
    @comments = @matter.comments
    @comment = @matter.comments.build
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def new
    @matter = Matter.new
  end

  def edit
  end

  def create
    @matter = current_user.matters.build(matter_params)

    if @matter.save
      redirect_to @matter, notice: 'Matter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @matter.update(matter_params)
      redirect_to @matter, notice: 'Matter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @matter.destroy
    redirect_to matters_url, notice: 'Matter was successfully destroyed.'
  end

  private
  def set_matter
    @matter = Matter.find(params[:id])
  end


  def matter_params
    params.require(:matter).permit(:title, :content, :address, :latitude, :longitude, :status, :priority, :start_time, :end_time, :remark, images: [])
  end

  def user_confirmation
    redirect_to root_path unless @matter.user_id == current_user.id || current_user.admin?
  end


end
