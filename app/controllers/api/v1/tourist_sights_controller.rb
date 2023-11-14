class Api::V1::TouristSightsController < ApplicationController

  def index
    @tourist_sights = TouristSightsFacade.find_sights(params[:country])
    if @tourist_sights
      render json: TouristSightSerializer.new(@tourist_sights)
    else
      render json: { error: 'Tourist sights not found' }, status: :not_found
    end
  end
end