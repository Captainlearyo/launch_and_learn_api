require 'rails_helper'

RSpec.describe 'Places Service' do
    it 'searches our API for tourist sites in places capital', :vcr  do
      lat = 2.33
      lng = 48.87

      response = PlacesService.find_tourist_sights(lat, lng)
      
      expect(response).to have_key(:features)
      expect(response[:features]).to be_a(Array)
      expect(response[:features][0][:properties]).to have_key(:name)
      expect(response[:features][0][:properties]).to have_key(:country)
  end
end