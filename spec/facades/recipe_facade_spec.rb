require 'rails_helper'

RSpec.describe 'Recipe Facade', :vcr do
  it 'should call the facade and retrieve search results' do
      search_term = 'italy'


      results = RecipeFacade.recipe_search(search_term)

      expect(results).to be_an(Array)

      next_recipe = results.first
      
      expect(next_recipe).to respond_to(:country)
      expect(next_recipe).to respond_to(:id)
      expect(next_recipe).to respond_to(:url)
      
  end
end