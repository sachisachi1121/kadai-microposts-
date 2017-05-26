class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micro = Micropost.find(params[:micropost_id])
    current_user.like(micro)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to root_path
  end

  def destroy
    micro = Micropost.find(params[:micropost_id])
    current_user.unlike(micro)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_path
  end
  
end
