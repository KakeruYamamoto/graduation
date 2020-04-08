# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to events_url, notice: "[#{favorite.event.title}]をあとで見るリストに追加しました"
  end

  def destroy
    favorite = current_user.favorites.find(params[:id]).destroy
    redirect_to events_url, notice: "[#{favorite.event.title}]をあとで見るリストから削除しました"
  end
end
