class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to events_url, notice: "[#{favorite.event.title}]のイベントをあとで見るリストしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to events_url, notice: "[#{favorite.event.title}]のイベントをあとで見るリストから解除しました"
  end
end
