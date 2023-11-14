require 'rails_helper'

RSpec.describe 'Tourist Facade', :vcr do
  it 'should call the facade and retrieve search results' do
    
      country = 'italy'


      results = TouristSightsFacade.find_sights(country)

      expect(results).to be_an(Array)
      
      expect(results.first).to respond_to(:address)
      expect(results.first).to respond_to(:id)
      expect(results.first).to respond_to(:name)
      expect(results.first).to respond_to(:place_id)
  end
end