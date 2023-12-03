class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:liked_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をお気に入りに登録しました。'
    redirect_to micropost.user
  end

  def destroy
    micropost = Micropost.find(params[:liked_id])
    current_user.unfavorite(micropost)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_to micropost.user
  end
end