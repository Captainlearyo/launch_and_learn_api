require 'rails_helper'

RSpec.describe 'Tourist Sights Index', type: :request do 

  it 'Happy Path Searches for Tourist Sights by latitude-longitude of the capital city', :vcr do
    VCR.use_cassette('happy_path_tourist_sights_search') do
      get "/api/v1/tourist_sights?country=France"

      expect(response).to be_successful
      
      json_response = JSON.parse(response.body, symbolize_names: true)
      
      expect(json_response).to be_an(Hash)
      expect(json_response).to have_key(:data) 
      expect(json_response[:data][0]).to have_key(:id)
      expect(json_response[:data][0]).to have_key(:type)
      expect(json_response[:data][0][:type]).to eq("tourist_sight")
      expect(json_response[:data][0]).to have_key(:attributes)
      expect(json_response[:data][0][:attributes]).to have_key(:name)
      expect(json_response[:data][0][:attributes]).to have_key(:address)
      expect(json_response[:data][0][:attributes]).to have_key(:place_id)
      
    end
  end

  it 'Sad Path Returns Tourist sights not found for bad search', :vcr do
    VCR.use_cassette('sad_path_tourist_sights_search') do
      get "/api/v1/tourist_sights?country=Wakanda"

      expect(response).to have_http_status(:not_found)
      
      json_response = JSON.parse(response.body, symbolize_names: true)
      
      expect(json_response).to be_an(Hash)
      expect(json_response).to have_key(:error)
      expect(json_response[:error]).to eq('Tourist sights not found')
      
    end
  end
end