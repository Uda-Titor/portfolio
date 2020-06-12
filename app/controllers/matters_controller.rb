class MattersController < ApplicationController
  before_action :set_matter, only: [:show, :edit, :update, :destroy]


  def index
    @search = Matter.ransack(params[:q])
    @matters = @search.result
  end

  def show
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
    params.require(:matter).permit(:title, :content, :address, :latitude, :longtitude, :status, :priority, :start_date, :completion_date, :remark)
  end
end
