class FavoritesController < ApplicationController
  def create
    @matter = Matter.find(params[:matter_id])
    favorite = current_user.favorites.build(matter_id: params[:matter_id])
    favorite.save
    @matter.create_notification_favorite!(current_user)
  end
  def destroy
    @matter = Matter.find(params[:matter_id])
    favorite = Favorite.find_by(matter_id: params[:matter_id], user_id: current_user.id)
    favorite.destroy
  end
end
