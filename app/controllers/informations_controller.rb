class InformationsController < ApplicationController
  before_action :set_information, only: %i[edit update destroy]

  def create
    @information = Information.new(information_params)
    respond_to do |format|
      if @information.save
        @informations = Information.all
        format.js { render :index }
      else
        format.html { redirect_to matters_path, alert: '投稿できませんでした...' }
      end
    end
  end

  def edit
    respond_to do |format|
      flash.now[:notice] = 'お知らせの編集中'
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @information.update(information_params)
        @informations = Information.all.order(created_at: :desc)
        flash.now[:notice] = 'お知らせが編集されました'
        format.js { render :index }
      else
        flash.now[:alert] = 'お知らせの編集に失敗しました'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @information.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      @informations = Information.all.order(created_at: :desc)
      format.js { render :index }
    end
  end

  private

  def set_information
    @information = Information.find(params[:id])
  end

  def information_params
    params.require(:information).permit(:content)
  end
end
