class Api::V1::LearningResourcesController < ApplicationController

  def index
    data = LearningResourceFacade.learning_resource(params[:country])
    render json: LearningResourceSerializer.new(data)
  end
end