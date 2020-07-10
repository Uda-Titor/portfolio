class MattersController < ApplicationController
  before_action :set_matter, only: %i[show edit update destroy]
  before_action :user_confirmation, only: %i[edit update destroy]

  def index
    @search = Matter.ransack(params[:q])
    @matters = @search.result.page(params[:page])
    @matters = @matters.order(created_at: :desc)

    @informations = Information.all
    @information = Information.new
  end

  def show
    @favorite = current_user.favorites.find_by(matter_id: @matter.id)
    if @matter.latest_sender != current_user.name && (@matter.user_id == current_user.id || current_user.admin == true)
      @matter.latest_sender = nil
      @matter.save
    end
    @comments = @matter.comments
    @comment = @matter.comments.build
    current_user.admin? ? @notifications = Notification.where(matter_id: @matter.id) : @notifications = Notification.where(matter_id: @matter.id, visited_id: current_user)
    if @notifications.present?
      if current_user.admin?
        @notifications.each do |notification|
          notification.update_attributes(admin_checked: true)
        end
      else
        @notifications.each do |notification|
          notification.update_attributes(checked: true)
        end
      end
    end
  end

  def new
    @matter = Matter.new
  end

  def edit; end

  def create
    @matter = current_user.matters.build(matter_params)

    if @matter.save
      redirect_to @matter, notice: '案件を作成しました！'
    else
      render :new
    end
  end

  def update
    if @matter.update(matter_params)
      redirect_to @matter, notice: '案件を編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @matter.destroy
    redirect_to matters_url, notice: '案件を削除しました！'
  end

  private

  def set_matter
    @matter = Matter.find(params[:id])
  end

  def matter_params
    params.require(:matter).permit(:title, :content, :address, :latitude, :longitude, :status, :priority, :start_time, :end_time, :remark, images: [], label_ids: [])
  end

  def user_confirmation
    redirect_to root_path unless @matter.user_id == current_user.id || current_user.admin?
  end
end
