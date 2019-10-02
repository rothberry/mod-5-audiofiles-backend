class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  def create
    p '**********CREATE FAVORITES*******'
    favorite = Favorite.new(favorite_params)
    p favorite_params
    p favorite
    if favorite.save
      render json: favorite, status: :created
    else
      render json: {errors: favorite.errors.full_messages}, status: :not_acceptable
    end
  end

  def destroy
    p '**********DESTROY FAVORITES*******'
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
    render json: {message: "Favorite Deleted"}
  end

  private

  def set_favorite
    favorite = Favorite.find_by(id: params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :song_id)
  end
  
end
