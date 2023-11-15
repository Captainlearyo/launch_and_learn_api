require 'rails_helper'

RSpec.describe "Learning Resources index" do
    it "Happy Path returns the correct JSON information", :vcr do

      get "/api/v1/learning_resources?country=mexico"

      expect(response).to be_successful

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to be_an(Hash)

      expect(json_response).to have_key(:data)
      expect(json_response[:data]).to have_key(:id)
      expect(json_response[:data][:id]).to be(nil)
      expect(json_response[:data]).to have_key(:attributes)
      expect(json_response[:data][:attributes]).to have_key(:country)
      expect(json_response[:data][:attributes]).to have_key(:video)
      expect(json_response[:data][:attributes][:video]).to be_a(Hash)  
      expect(json_response[:data][:attributes]).to have_key(:images)
      expect(json_response[:data][:attributes][:images]).to be_an(Array)  
    end

    it "Sad Path returns empty if no results are found", :vcr do

      get "/api/v1/learning_resources?country=no_a_real_place"

      expect(response).to be_successful
      
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:data][:attributes][:video]).to be_empty
      expect(json_response[:data][:attributes][:images]).to be_empty
    end
end