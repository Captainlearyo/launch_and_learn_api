require 'rails_helper'

RSpec.describe 'Recipe Service' do
    it 'searches our API for a recipe item', :vcr  do
      search_term = 'germany'

      response = RecipeService.recipe_search(search_term)
      
      expect(response).to have_key(:hits)
      expect(response[:hits]).to be_a(Array)
      expect(response[:hits][0][:recipe]).to have_key(:uri)
      expect(response[:hits][0][:recipe]).to have_key(:label)
      expect(response[:hits][0][:recipe]).to have_key(:image)
  end
end