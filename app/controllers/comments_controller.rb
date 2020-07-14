class CommentsController < ApplicationController
  before_action :set_matter, only: %i[create edit update]
  def create
    @matter = Matter.find(params[:matter_id])
    @comment = @matter.comments.build(comment_params)
    @comment.user = current_user
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        # 最後の送信者の名前を登録
        @matter.latest_sender = current_user.name
        @matter.save
        @matter.create_notification_comment!(current_user, @comment.id)
        format.js { render :index }
      else
        format.html { redirect_to matter_path(@matter), alert: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = @matter.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @matter.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:alert] = 'コメントの編集に失敗しました'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:matter_id, :content)
  end

  def set_matter
    @matter = Matter.find(params[:matter_id])
  end
end
