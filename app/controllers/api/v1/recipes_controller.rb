class Api::V1::RecipesController < ApplicationController
  def index
    @q = params[:country]
    if @q == "random"
      @random_country = CountryFacade.random_country
      @recipes = RecipeFacade.recipe_search(@random_country) 
    else
      @country = CountryFacade.find_country(@q)
      @recipes = RecipeFacade.recipe_search(@country.downcase)
    end
    
    render json: RecipeSerializer.new(@recipes)
  end
end