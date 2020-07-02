class Admin::LabelsController < ApplicationController

  def create
    @label = Label.new(label_params)
    respond_to do |format|
      if @label.save
        @labels = Label.all
        format.js { render :index }
      else
        format.html { redirect_to matters_path, notice: '投稿できませんでした...' }
      end
    end
  end

  # DELETE /labels/1
  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      @labels = Label.all.order(created_at: :desc)
      format.js { render :index }
    end
  end

  private
    def label_params
      params.require(:label).permit(:name)
    end
end
