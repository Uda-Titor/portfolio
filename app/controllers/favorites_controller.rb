class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(matter_id: params[:matter_id])
    redirect_to matters_url, notice: "#{favorite.matter.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to matters_url, notice: "#{favorite.matter.user.name}さんのブログをお気に入り解除しました"
  end
end
