class Api::V1::FavoritesController < ApplicationController

  def create
    json_response = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: json_response[:api_key])
    if user
      Favorite.create(country: json_response[:country], recipe_link: json_response[:recipe_link], recipe_title: json_response[:recipe_title], user_id: user.id)
      render json: {success: "Favorite added successfully"}
    else
      render json: { error: "No user found for api_key"}, status: :not_found
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      favorites = Favorite.where('user_id = ?', user.id)
      render json: FavoriteSerializer.new(favorites)
    else
      render json: {error: "Invalid api_key provided"}, status: :forbidden
    end
  end
end